{ ... }: {
    flake.homeModules.unmanaged = { config, pkgs, ... }: {
      home.packages = with pkgs; [
        fatfetch
        ranger
        mpv
        nautilus trash-cli
        pavucontrol
        ffmpeg yt-dlp
        unzip
        python3
        python3Packages.pip
      ];
  };
}
