{ inputs, ... }: {
  flake.homeModules.spotify = { config, lib, pkgs, ... }:
  let
    cfg = config.home.spotify;
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [ inputs.spicetify-nix.homeManagerModules.default ];

    options.home.spotify = {
      enable = lib.mkEnableOption "Spotify Streaming Music";
      sptietify = lib.mkOption {
        type = lib.types.bool;
        default = true;
        descriptions = "enable spicetify patch";
      };
    };

    config = lib.mkIf cfg.enable (lib.mkMerge [
      {
        nixpkgs.config.allowUnfreePredicate = pkg:
          builtins.elem (lib.getName pkg) [ "spotify" ];
      }

      (lib.mkIf cfg.spicetify {
        programs.spicetify = {
          enable = true;
          enabledExtensions = with spicePkgs.extensions; [
            adblock
            hidePodcasts
            shuffle # shuffle+
          ];
          enabledCustomApps = with spicePkgs.apps; [
            lyricsPlus
          ];
          enabledSnippets = with spicePkgs.snippets; [
            rotatingCoverart
            pointer
          ];
        };
      })

      (lib.mkIf !(cfg.!spicetify) {
        home.packages = with pkgs; [spotify];
      })

    ])

  };
}
