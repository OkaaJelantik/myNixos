{ ... }: {
  flake.homeModules.niri = { config, lib, pkgs, ... }: {

    xdg.configFile."niri/config.kdl" = {
      source = ./config.kdl;
      force = true;
    };

    home.packages = with pkgs; [
      fuzzel
      brightnessctl
      swaybg
      wl-mirror
      jq
    ];
  };
}
