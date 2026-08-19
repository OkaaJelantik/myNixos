{ ... }: {
  flake.homeModules.ytstream = { config, lib, pkgs, ... }:
  let
    cfg = config.home.ytstream;
    ytradio = pkgs.writeShellScriptBin "ytstream" ''
      #!/usr/bin/env bash
      set -euo pipefail

      YTDLP="${pkgs.yt-dlp}/bin/yt-dlp"
      FFPLAY="${pkgs.ffmpeg}/bin/ffplay"

      if [ -z "''${1:-}" ]; then
        echo "Usage: ytradio <search query or YouTube URL>"
        exit 1
      fi

      query="$1"

      if [[ "$query" =~ ^https?:// ]]; then
        video_id=$("$YTDLP" --get-id "$query" 2>/dev/null)
      else
        echo "Searching: $query"
        video_id=$("$YTDLP" "ytsearch1:$query" --get-id 2>/dev/null)
      fi

      if [ -z "$video_id" ]; then
        echo "Failed to find video for query: $query"
        exit 1
      fi

      echo "Starting radio from video: $video_id"

      "$YTDLP" "https://www.youtube.com/watch?v=''${video_id}&list=RD''${video_id}" \
        -f bestaudio --get-id --ignore-errors 2>/dev/null | while read -r id; do
          echo ""
          echo ">> Playing: https://youtube.com/watch?v=$id"
          "$YTDLP" -f bestaudio "https://youtube.com/watch?v=$id" -o - 2>/dev/null | \
            "$FFPLAY" -hide_banner -nodisp -autoexit -i -
        done
    '';
  in {
    options.home.ytstream = {
      enable = lib.mkEnableOption "Simple music streaming";
    };

    config = lib.mkIf cfg.enable {
      home.packages = [
        ytradio
        pkgs.ffmpeg
        pkgs.yt-dlp
      ];
    };
  };
}
