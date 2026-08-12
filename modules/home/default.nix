{ inputs, self,  ... }: {
  flake.homeConfigurations."lann@seirios" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      inputs.self.homeModules.niri
      inputs.self.homeModules.noctalia-shell
      inputs.self.homeModules.fonts
      inputs.self.homeModules.git
      inputs.self.homeModules.firefox-hardened
      inputs.self.homeModules.zsh
      inputs.self.homeModules.kitty
      inputs.self.homeModules.nvim
      inputs.self.homeModules.antigravity
      inputs.self.homeModules.spotify
      inputs.self.homeModules.unmanaged

      {
        home.username = "lann";
        home.homeDirectory = "/home/lann";
        home.stateVersion = "26.05";
      }

    ];
  };
}
