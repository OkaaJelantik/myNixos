{ self, ... }: {
  flake.homeModules.profile-cli = { config, lib, ... }: {
    imports = [
      self.homeModules.profile-common
      self.homeModules.antigravity
      self.homeModules.filemanager
      self.homeModules.ytstream
    ];

    config = {
      home.git.enable = lib.mkDefault true;
      home.zsh.enable = lib.mkDefault true;
      home.antigravity.enable = lib.mkDefault false; 
      home.filemanager.enable = lib.mkDefault true;
      home.ytstream.enable = lib.mkDefault false;
    };
  };
}
