{ ... }: {
  flake.homeModules.niri = { config, lib, pkgs, ... }: {

    xdg.configFile."niri/config.kdl" = {
      source = ./config.kdl;
      force = true;
    };

    home.packages = with pkgs; [
      brightnessctl
      wl-mirror
      jq
    ];
  };
}
