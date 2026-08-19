{ ... }: {
  flake.nixosModules.labs-network-recon = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.labs.networkRecon;
    in {
      options.nixos.labs.networkRecon = {
        enable = lib.mkEnableOption "Network Reconnaissance, Utilities & Testing Tools";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          # Network Reconnaissance & Testing
          nmap               # Port scanner / host discovery
          netcat-gnu         # TCP/UDP Swiss-army knife (nc)
          inetutils          # ping, traceroute, telnet, ftp, etc.
          iperf3             # Bandwidth testing
          mtr                # Traceroute + ping combined

          # Network Utilities
          iproute2           # ip, ss, tc commands
          bridge-utils       # brctl
          ethtool            # NIC info / speed settings
          openvswitch        # OpenVSwitch - software switch

          # Retrieval Tools
          curl
          wget
        ];
      };
    };
}
