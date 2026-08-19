{ ... }: {
  flake.homeModules.kitty = { config, lib, pkgs, ... }: 
  let 
    cfg = config.home.kitty;
  in {
    options.home.kitty = {
      enable = lib.mkEnableOption "Enable Kitty Terminal";
    };

    config = lib.mkIf cfg.enable {
      programs.kitty = {
        enable = true;
        settings = {
          background_opacity = "0.6";
	        background_blur = "1";
	        window_padding_width = "10";

	        font_family = "JetBrainsMono Nerd Font";
	        bold_font = "auto";
	        italic_font = "auto";
	        bold_italic_font = "auto";
	        font_size = "10.0";
        };
      };
    };
  };
}

