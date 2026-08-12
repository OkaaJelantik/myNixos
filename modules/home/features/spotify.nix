{ inputs, ... }: {
  flake.homeModules.spotify = { config, lib, pkgs, ... }: {
    imports = [ inputs.spicetify-nix.homeManagerModules.default ];

    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "spotify"
      ];

    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      in {
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
  };
}
