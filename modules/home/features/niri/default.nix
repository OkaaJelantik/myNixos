{ ...  }: {
  flake.homeModules.niri = { config, lib, pkgs, ... }: {

    xdg.configFile."niri/config.kdl" = {
      source = ./config.kdl;
      force = true;
    };

    dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

    gtk = {
      enable = true;
      gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    qt = {
      enable = true;
      platformTheme.name = "qt6ct";
      style.name = "kvantum";
    };

    home.packages = with pkgs; [
      brightnessctl
      wl-mirror
      wl-screenrec
      jq
      qt6Packages.qt6ct qt6Packages.qtstyleplugin-kvantum 
    ];
  };
}
