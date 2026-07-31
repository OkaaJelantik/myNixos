{ ... }: {
  flake.homeModules.kitty = { config, lib, pksg, ... }: {
    programs.kitty = {
      enable = true;
        settings = {
          background_opacity = "0.75";
	  background_blur = "1";
	  window_padding_width = "10";
        };
    };
  };
}

