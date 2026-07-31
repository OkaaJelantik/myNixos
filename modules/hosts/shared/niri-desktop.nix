{ self, inputs, ... }: {
  flake.nixosModules.niri-desktop-unstable = { config, pkgs, lib, ... }: {
    imports = [
    ];

    nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };


    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };

    security.rtkit.enable = true;
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
