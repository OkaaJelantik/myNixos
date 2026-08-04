{ ... }: {
  flake.homeModules.lann-pkgs = { pkgs, ... }: {
    home.packages = with pkgs; [
      fastfetch
      github-cli
      ranger
      mpv mpvpaper
      btop
      nautilus trash-cli
      pavucontrol
      ffmpeg yt-dlp
      unzip
      python3
      python3Packages.pip
      onlyoffice-desktopeditors
    ];
  };
}
