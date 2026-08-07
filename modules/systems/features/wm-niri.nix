# Currently Monolithic - For Desktop Only
{ inputs,  ... }: {
  flake.nixosModules.wm-niri = { config, pkgs, lib, ... }: {
    imports = [];

    nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };

    services.greetd = {
      enable = true;
      settings = {
	      default_session = {
	        command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
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
      config.common.default = "gtk";
    };

  };
}
