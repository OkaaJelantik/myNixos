{ self, inputs, ... }: {
  flake.nixosModules.desktop = { config, pkgs, lib, ... }: {
    imports = [
      inputs.niri-flake.nixosModules.niri
    ];

    nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    environment.systemPackages = with pkgs; [
      gtk3
      gtk4
    ];

    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };
    security.rtkit.enable = true;

    security.polkit.enable = true;
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
      config.common.default = "gtk";
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user = "greeter";
        };
      };
    };
  };
}
