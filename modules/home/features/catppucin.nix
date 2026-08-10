{ inputs, ... }: {
  flake.homeModules.catppuccin-nix = { config, lib, pkgs, ... }: {
    imports = [ inputs.catppuccin-nix.homeManagerModules.catppuccin ];

    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "mauve";
    };

  };
}
