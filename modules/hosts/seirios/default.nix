{ self, inputs, ... }: {
  flake.nixosConfigurations.seirios = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.seirios-configuration
      self.nixosModules.seirios-pkgs
      self.nixosModules.dns-cloudflare
      self.nixosModules.common
      self.nixosModules.niri-desktop-unstable
    ];
  };
}
