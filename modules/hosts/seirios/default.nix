{ self, inputs, ... }: {
  flake.nixosConfigurations.seirios = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.seirios-configuration
    ];
  };
}
