{ self, inputs, ... }: {
  flake.homeModules.lann-niri = { config, lib, pkgs, ... }: {

    xdg.configFile."niri/config.kdl".source = ./config.kdl;

    home.packages = with pkgs; [
      kitty
      fuzzel
      brightnessctl
    ];
  };
}
