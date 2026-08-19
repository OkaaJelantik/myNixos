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
              config.home = {
                antigravity.enable = true;
                nvim.enable = false;
              };
              home.stateVersion = "26.05";
            }
          ];
        };
      }
      ./configuration.nix
    ];
  };
}
