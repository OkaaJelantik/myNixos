{ self, inputs, ... }: {
  flake.nixosModules.labs = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.labs-virtualization
      self.nixosModules.labs-packet-capture
      self.nixosModules.labs-gns3
      self.nixosModules.labs-network-recon
      self.nixosModules.labs-tftp
      self.nixosModules.labs-terminal
    ];

    config.nixos.labs = {
      virtualization.enable = lib.mkDefault true;
      packetCapture.enable = lib.mkDefault true;
      gns3.enable = lib.mkDefault true;
      networkRecon.enable = lib.mkDefault true;
      tftp.enable = lib.mkDefault true;
      terminal.enable = lib.mkDefault true;
    };
  };
}
