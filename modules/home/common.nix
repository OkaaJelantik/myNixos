{ self, inputs, ... }: {
  flake.homeModules.common = { config, lib, pkgs, ... }: {
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      userName = "Oka Jelantik";
      userEmail = "okajelantikstdy@gmail.com";
      extraConfig.init.defaultBranch = "main";
    };

    home.stateVersion = "26.05";
  };
}
