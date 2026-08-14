{ self, ... }: {
  flake.nixosModules.labs-gns3 = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.labs.gns3;
      username = config.nixos.mainUser;
    in {
      options.nixos.labs.gns3 = {
        enable = lib.mkEnableOption "GNS3 Network Simulator Core";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          gns3-gui
          gns3-server
          dynamips
          vpcs
        ];

        networking.firewall.allowedTCPPorts = [ 3080 ];
      };
    };
}
