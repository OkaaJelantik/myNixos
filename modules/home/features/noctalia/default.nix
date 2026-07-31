{ inputs, ... }: {
  flake.homeModules.noctalia-shell = { config, pkgs, ... }: {
    imports = [ inputs.noctalia-shell.homeModules.default ];

    programs.noctalia = {
      enable = true;
      settings = {
        theme = {
	  mode = "dark";
	  source = "builtin";
	  builtin = "Catppuccin";
	};

	wallpaper = {
	  enabled = true;
	  default.path = "/home/lann/Pictures/Wallpapers/default.jpg";
	};
      };
    };
  };
}
