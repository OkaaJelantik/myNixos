{ ... }: {
  flake.homeModules.lann-pkgs = { pkgs, ... }: {
    home.packages = with pkgs; [
      fastfetch
      neovim
      firefox
      github-cli
      texlivePackages.jetbrainsmono-otf
      nerd-fonts.symbols-only
    ];
  };
}
