{ inputs, ... }: {
  flake.homeModules.firefox = { config, lib, pkgs, ... }: 
  let 
    cfg = config.home.firefox;
  in {
    imports = [ inputs.arkenfox-firefox.hmModules.arkenfox ];

    options.home.firefox = {
      enable = lib.mkEnableOption "Firefox Browser";
      hardened = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Arkenfox";
      };
    };

    config = lib.mkIf cfg.enable {
      programs.firefox = {
        enable = true;
        arkenfox = {
          enable = ${cfg.hardened};
          version = "master";
        };
        profiles.default.arkenfox = {
          enable = true;
          enableAllSections = true;
          # STARTUP
          "0100" = {
	          "0102"."browser.startup.page".value = 3;
          };
        };
      };
    };
  };
}
