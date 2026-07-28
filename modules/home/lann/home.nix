{ self, inputs, ... }: {
  flake.homeModules.lann = { config, lib, pkgs, ... }: {
    imports = [
      self.homeModules.lann-niri
      self.homeModules.lann-waybar
    ];

    home.username = "lann";
    home.homeDirectory = "/home/lann";

    home.packages = with pkgs; [
      fastfetch
      neovim
      firefox
      texlivePackages.jetbrainsmono-otf
      nerd-fonts.symbols-only
    ];

  };
}
