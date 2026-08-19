{ self, ... }: {
  flake.homeModules.profile-cli = { config, lib, ... }: {
    imports = [
      self.homeModules.git
      self.homeModules.zsh
      self.homeModules.antigravity
    ];

    config = {
      home.git.enable = lib.mkDefault true;
      home.zsh.enable = lib.mkDefault true;
      home.antigravity.enable = lib.mkDefault false; 
    };
  };
}
