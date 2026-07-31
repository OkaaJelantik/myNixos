{ ... }: {
  flake.homeModules.lann-pkgs = { pkgs, ... }: {
    home.packages = with pkgs; [
      fastfetch
      neovim
      firefox
      github-cli
      ranger
      mpv mpvpaper
      btop
      nautilus trash-cli
    ];
  };
}
