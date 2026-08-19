{ ... }: {
  flake.homeModules.multimedia = { config, lib, pkgs, ... }:
  let
    cfg = config.home.multimedia;
  in {
    options.home.multimedia = {
      enable = lib.mkEnableOption "Enable multimedia and players";
      image = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable image viewer";
      };
      video = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable video player";
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages = lib.mkMerge [
        (lib.mkIf cfg.image [ pkgs.imv ])
        (lib.mkIf cfg.video [ pkgs.mpv ])
      ];
    };
  };
}
