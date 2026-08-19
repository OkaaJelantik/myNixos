{ self, ... }: {
  flake.homeModules.profile-common = { config, lib, ... }: {
    imports = [
      self.homeModules.git
      self.homeModules.zsh
      self.homeModules.nvim
    ];

    config = {
      home.git.enable = lib.mkDefault true;
      home.zsh.enable = lib.mkDefault true;
      home.nvim.enable = lib.mkDefault true;
    };
  };
}

