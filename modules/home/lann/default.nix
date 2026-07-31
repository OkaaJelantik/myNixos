{ inputs, config, ... }: {
  flake.homeConfigurations."lann" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      config.flake.homeModules.git
      config.flake.homeModules.lann-pkgs
      config.flake.homeModules.lann-fonts
      config.flake.homeModules.niri
      config.flake.homeModules.noctalia-shell
      config.flake.homeModules.zsh
      config.flake.homeModules.kitty
      config.flake.homeModules.firefox-hardened
      { home.username = "lann"; home.homeDirectory = "/home/lann"; home.stateVersion = "26.05"; }
    ];
  };
}
