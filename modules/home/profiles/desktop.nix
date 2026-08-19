{ self, ... }: {
  flake.homeModules.profile-desktop = { config, lib, ... }: {
    imports = [
      self.homeModules.common
      self.homeModules.fonts
      self.homeModules.antigravity
      self.homeModules.filemanager
      self.homeModules.ytstream
      self.homeModules.multimedia
      self.homeModules.spotify
      self.homeModules.firefox
      self.homeModules.kitty
    ];

    config = {
      home.antigravity = {
        enale = lib.mkDefault true;
        gui
      }
      home.filemanager = {
        enable = lib.mkDefault true;
        profile  = lib.mkDefaul "desktop";
      };
      home.ytstream.enable = lib.mkDefault false;
    };
  };
}

