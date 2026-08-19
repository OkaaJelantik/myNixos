{ ... }: {
  flake.nixosModules.pipewire = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.pipewire;
    in {
      options.nixos.pipewire.enable = lib.mkEnableOption "Pipewire Config";

      config = lib.mkIf cfg.enable {
        security.rtkit.enable = true;

        services.pipewire = {
          enable = true;
          alsa.enable = true;
          pulse.enable = true;
         };
      };
    };
}
