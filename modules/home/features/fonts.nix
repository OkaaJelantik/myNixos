{ config, lib, pkgs, ...  }: { 
  flake.homeModules.fonts = { ... }: 
  let 
    cfg = config.home.fonts;
    hp = home.packages;
  in {
    options.home.fonts = {
      enable = lib.mkEnableOption "Manage Font";
      jetbrains-pack = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Aku sukaa iniii";
      };

      # Tambah disini
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
      {
        fonts.fontconfig.enable = true;
      }

      (lib.mkIf cfg.jetbrains-pack {hp = with pkgs; [
        nerd-fonts.jetbrains-mono
        nerd-fonts.symbols-only
      ]})

      # Tambah disini
    ])
  };
}
