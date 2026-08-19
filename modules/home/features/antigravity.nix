{ inputs, ... }: {
  flake.homeModules.antigravity = { config,lib, pkgs, ... }: 
  let
    cfg = config.home.antigravity;
    agy = inputs.antigravity-nix.packages.${pkgs.system};
  in {
    options.home.antigravity = {
      enable = lib.mkEnableOption "Antigravity by Google";
      profile = lib.mkOption {
        type = lib.types.enum [ "cli" "desktop" ];
        default = "cli";
        description = "Profiles to custom install Antigravity";
      };
      sandbox = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "sandboxing";
      };
    };

    config = lib.mkIf cfg.enable {
      home.packages = lib.mkMerge [
        [agy.google-antigravity-cli]
        (lib.mkIf (cfg.profile == "desktop" && cfg.sandbox)
          [agy.google-antigravity]
        ) 
        (lib.mkIf (cfg.profile == "desktop" && !cfg.sandbox)
          [agy.google-antigravity-no-fhs]
        ) 
      ];
    };
  };
}
