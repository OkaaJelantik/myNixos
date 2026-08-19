{ ... }: { 
  flake.homeModules.fonts = { config, lib, pkgs, ... }: 
  let 
    cfg = config.home.fonts;
  in {
    options.home.fonts = {
      enable = lib.mkEnableOption "Manage Font";
      jetbrains-pack = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Aku sukaa iniii";
      };
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
      {
        fonts.fontconfig.enable = true;
      }

      (lib.mkIf cfg.jetbrains-pack {
        home.packages = with pkgs; [
          nerd-fonts.jetbrains-mono
          nerd-fonts.symbols-only
        ];
      })
    ]);
  };
}
