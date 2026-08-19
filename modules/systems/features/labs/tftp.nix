{ ... }: {
  flake.nixosModules.labs-tftp = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.labs.tftp;
    in {
      options.nixos.labs.tftp = {
        enable = lib.mkEnableOption "TFTP Server & Client for IOS Configuration & Images Transfer";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          atftp
        ];

        networking.firewall.allowedUDPPorts = [ 69 ];
      };
    };
}
