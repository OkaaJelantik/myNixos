{ self, inputs, ... }: {
  flake.nixosConfigurations.wsl = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.nixos-wsl.nixosModules.default
      self.nixosModules.common
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.lann = {
          imports = [
            self.homeModules.profile-cli
            {
              home.antigravity.enable = true;
              home.nvim.enable = false;
              home.stateVersion = "26.05";
            }
          ];
        };
      }
      self.nixosModules.hosts-wsl
    ];
  };
}
