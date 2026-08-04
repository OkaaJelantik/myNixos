{ inputs, ... }: {
  flake.homeModules.firefox-hardened = { pkgs, ... }: {
    imports = [ inputs.arkenfox-firefox.hmModules.arkenfox ];

    programs.firefox = {
      enable = true;
      arkenfox = {
        enable = true;
        version = "master";
      };
      profiles.default.arkenfox = {
        enable = true;
        enableAllSections = true;
        # STARTUP
        "0100" = {
	  "0102"."browser.startup.page".value = 3;
        };
        "2800".enable = false;
      };
    };
  };
}
