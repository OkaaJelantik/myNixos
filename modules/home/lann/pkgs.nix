{ ... }: {
  flake.homeModules.lann-pkgs = { pkgs, ... }: {
    home.packages = with pkgs; [
      fastfetch
      neovim
      firefox
      github-cli
      jetbrains-mono
      nerd-fonts.symbols-only
      ranger
      mpv
      mpvpaper
      btop
    ];
  };
}
