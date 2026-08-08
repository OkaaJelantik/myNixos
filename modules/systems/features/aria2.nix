{ inputs, ... }: {
  flake.nixosModules.aria2 = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.aria2;
    in {
      options.nixos.aria2 = {
        enable = lib.mkEnableOption "Aria2";
        daemon = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "enable rpc";
        };
      };
      config = lib.mkIf cfg.enable {
        environment.systemPackages = [ pkgs.aria2 ];

        age.secrets.aria2-secret = {
          file = ../../../secrets/aria2-secret.age;
          owner = "aria2";
          group = "aria2";
          mode = "0400";
        };

        services.aria2 = {
          enable = cfg.daemon;
          rpcSecretFile = config.age.secrets.aria2-secret.path;
        };
      };
    };
}
