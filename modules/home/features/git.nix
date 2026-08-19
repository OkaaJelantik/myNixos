{ ... }: {
  flake.homeModules.git = { config, lib, pkgs, ... }: 
    let 
      cfg = config.home.git;
    in {
      options.home.git = {
          enable = lib.mkEnableOption "Git Configuration";
      };

      config = lib.mkIf cfg.enable {
        programs.git = {
          enable = true;
          settings.user.name = "Oka Jelantik";
          settings.user.email = "okajelantikstdy@gmail.com";
          settings.extraConfig.init.defaultBranch = "main";
        };
        home.packages = with pkgs; [
          github-cli
        ];
      };
    };
}
