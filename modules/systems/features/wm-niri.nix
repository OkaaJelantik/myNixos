{ inputs, ... }: {
  flake.nixosModules.wm-niri = { config, pkgs, lib, ... }: {
    options.nixos.niri = {
      enable = lib.mkEnableOption "Niri Window Manager";
      package = lib.mkOption {
        type = lib.types.enum [ "main" "custom" ];
        default = "main";
        description = "Choose between standard nixpkgs niri ('main') or niri-flake ('custom').";
      };
      xsupport = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable XWayland support.";
      };
      autologin = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable automatic login via greetd.";
      };
    };

    config = let
      cfg = config.nixos.niri;
    in lib.mkIf cfg.enable (lib.mkMerge [
      {
        services.greetd = {
          enable = true;
          settings = {
            default_session = {
              command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
            }; 
          } // lib.optionalAttrs cfg.autologin {
            initial_session = {
              command = "niri-session";
              user = config.nixos.mainUser;
            };
          };
        };

        security.polkit.enable = true;

        xdg.portal = {
          enable = true;
          extraPortals = with pkgs; [ 
            xdg-desktop-portal-gtk
            xdg-desktop-portal-gnome
          ];
        };

        programs.xwayland.enable = lib.mkIf cfg.xsupport true;
      }

      (lib.mkIf (cfg.package == "custom") {
        nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
        programs.niri = {
          enable = true;
          package = pkgs.niri-unstable;
        };
      })

      (lib.mkIf (cfg.package == "main") {
        programs.niri = {
          enable = true;
        };
      })
    ]);
  };
}
