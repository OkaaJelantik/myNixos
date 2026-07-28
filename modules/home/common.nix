{ self, inputs, ... }: {
  flake.homeModules.common = { config, lib, pkgs, ... }: {
    programs.home-manager.enable = true;

    programs.git = {
      enable = true;
      settings.user.name = "Oka Jelantik";
      settings.user.email = "okajelantikstdy@gmail.com";
      settings.extraConfig.init.defaultBranch = "main";
    };

    home.stateVersion = "26.05";
  };
}
