{ ...  }: {
  flake.nixosModules.bluetooth = { config, lib, pkgs,  ... }: {
    let
      cfg = config.nixos.bluetooth;
    in {
      options.nixos.bluetooth = {
        enable = lib.mkEnableOption "Bluetooth Backend";
        onBoot = lib.mkOption = {
          type = lib.types.bool;
          default = true;
          description = "Startup Options";
        };
      }

      config = lib.mkIf cfg.enable {
        hardware.bluetooth = {
            enable = true;
            powerOnBoot = cfg.onBoot;
        };
      };
    };
  };
}

