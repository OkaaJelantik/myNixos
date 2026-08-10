{ ... }: {
    flake.homeModules.unmanaged = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        fastfetch
        ranger
        mpv
        nautilus trash-cli
        pavucontrol
        ffmpeg yt-dlp
        unzip
        python3
        python3Packages.pip
        qbittorrent
      ];
  };
}
