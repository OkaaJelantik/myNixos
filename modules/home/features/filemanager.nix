{ config, lib, pkgs, ... }: {
  flake.homeModules.filemanager = { ... }:
  let 
    cfg = config.home.filemanager;
  in {
    options.home.filemanager = {
      enable = lib.mkEnableOption "file manager configuration";
      gui = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "enable gui filemanager";
      };
      gui-selected = lib.mkOption {
        type = lib.types.enum [
          "nautilus"
        ];
        default = "nautilus";
        description = "type of gui filemanager";
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages = lib.mkMerge [
        [ranger]
        (lib.mkIf (cfg.gui)
          [${cfg.gui-selected}]
        )
      ];
    };
  };
}
