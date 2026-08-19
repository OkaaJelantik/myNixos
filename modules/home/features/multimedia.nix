{ config, lib, pkgs, ... }: {
  flake.homeModules.multimedia = { ... }:
  let
    cfg = config.home.multimedia;
  in {
    options.home.multimedia = {
      enbale = lib.mkEnableOption "Enable multimedia and players";
      image = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable image viewer";
      };
      video = lib.mkOption = {
        type = lib.types.bool;
        default = true;
        description = "Enable video player";
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages = lib.mkMerge [
        (lib.mkIf cfg.image [imv])
        (lib.mkIf cfg.video [mpv])
      ];
    };
  };
}
