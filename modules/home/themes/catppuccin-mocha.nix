{ ... }: { 
  flake.homeModules.theme-catppuccin-mocha = { config, lib, pkgs, ... }: {
    gtk = {
      enable = true;
      theme = {
        name = "catppuccin-mocha-mauve";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "mauve" ];
          size = "standard";
          variant = "mocha";
        };
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
      };
    };

    home.pointerCursor = {
      enable = true;
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
      gtk.enable = true;
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "catppuccin-mocha-mauve";
          icon-theme = "Papirus-Dark";
          cursor-theme = "Adwaita";
          cursor-size = 24;
        };
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk3";
      style.name = "adwaita-dark";
    };
  };
}
