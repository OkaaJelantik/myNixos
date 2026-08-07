{ ... }: {
  flake.homeModules.git = { pkgs, ... }: {
    programs.git = {
      enable = true;
      settings.user.name = "Oka Jelantik";
      settings.user.email = "okajelantikstdy@gmail.com";
      settings.extraConfig.init.defaultBranch = "main";
    };
    programs.github-cli.enable = true;
  };
}
