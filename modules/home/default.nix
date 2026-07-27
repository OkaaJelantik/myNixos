{ self, inputs, ... }: {
  flake.homeConfigurations."lann" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    extraSpecialArgs = { inherit self inputs; };
    modules = [
      self.homeModules.common
      self.homeModules.lann
    ];
  };
}
