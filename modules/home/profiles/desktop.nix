{ self, ... }: {
  flake.homeModules.profile-desktop = { config, lib, ... }: {
    imports = [
      self.homeModules.profile-common
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
        enable = lib.mkDefault true;
        profile = lib.mkDefault "desktop";
      };
      home.filemanager = {
        enable = lib.mkDefault true;
        gui = lib.mkDefault true;
      };
      home.ytstream.enable = lib.mkDefault false;
    };
  };
}

