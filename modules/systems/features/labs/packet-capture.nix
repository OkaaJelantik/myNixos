{ ... }: {
  flake.nixosModules.labs-packet-capture = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.labs.packetCapture;
      username = config.nixos.mainUser;
    in {
      options.nixos.labs.packetCapture = {
        enable = lib.mkEnableOption "Packet Capture Tools (Wireshark/tcpdump)";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          wireshark
          tcpdump
        ];

        programs.wireshark = {
          enable = true;
          package = pkgs.wireshark;
        };

        security.wrappers.ubridge = {
          source      = "${pkgs.ubridge}/bin/ubridge";
          capabilities = "cap_net_admin,cap_net_raw=ep";
          owner       = "root";
          group       = "ubridge";
          permissions = "u+rx,g+rx,o+rx";
        };

        users.groups.ubridge = {};

        users.users.${username}.extraGroups = [
          "ubridge"
          "wireshark"
        ];
      };
    };
}
