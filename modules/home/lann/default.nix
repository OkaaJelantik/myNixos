{ inputs, config, ... }: {
  flake.homeConfigurations."lann" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      config.flake.homeModules.git
      config.flake.homeModules.niri
      config.flake.homeModules.waybar
      config.flake.homeModules.kitty
      config.flake.homeModules.theme-catppuccin-mocha
      { home.username = "lann"; home.homeDirectory = "/home/lann"; home.stateVersion = "26.05"; }
    ];
  };
}
