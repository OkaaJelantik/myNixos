{ inputs, self,  ... }: {
  flake.homeConfigurations."lann@seirios" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      self.homeModules.profile-desktop
      self.homeModules.niri
      self.homeModules.noctalia-shell
      self.homeModules.nvim
      self.homeModules.unmanaged
      {
        home.username = "lann";
        home.homeDirectory = "/home/lann";
        home.stateVersion = "26.05";
      }

    ];
  };
}
