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

    config = {
      nixos.labs.virtualization.enable = lib.mkDefault true;
      nixos.labs.packetCapture.enable = lib.mkDefault true;
      nixos.labs.gns3.enable = lib.mkDefault true;
      nixos.labs.networkRecon.enable = lib.mkDefault true;
      nixos.labs.tftp.enable = lib.mkDefault true;
      nixos.labs.terminal.enable = lib.mkDefault true;
    };
  };
}
