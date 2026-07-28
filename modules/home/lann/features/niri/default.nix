{ self, inputs, ... }: {
  flake.homeModules.lann-niri = { config, lib, pkgs, ... }: {

    xdg.configFile."niri/config.kdl" = {
      source = ./config.kdl;
      force = true;
    };

    home.packages = with pkgs; [
      kitty
      fuzzel
      brightnessctl
      swaybg
    ];

    programs.kitty = {
      enable = true;
      settings = {
        background_opacity = "0.75";
	background_blur = "1";
	window_padding_width = "10";
      };
    };
  };
}
