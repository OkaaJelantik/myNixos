{ ... }: {
  flake.homeModules.waybar = { config, lib, pkgs, ... }: {
    
    programs.waybar = {
      enable = true;
      
      settings = [{
        layer = "top";
	position = "top";
	margin-top = 5;
	margin-left = 5;
	margin-right = 5;
	modules-left = [ "niri/workspaces" "niri/window" "mpris"];
	modules-center = [ "clock" ];
	modules-right = [ "tray" "network" "backlight" "pulseaudio" "battery" ]; 

	"niri/workspaces" = {
	  format = "{index}";
	  on-click = "activate";
        };

	"niri/window" = {
	  max-length = 20;
	  separate-outputs = true;
        };

        clock = {
          interval = 1;
	  format = "{:%H:%M:%S}";
	  format-alt = "{:%A, %e %B - %H:%M}";
	  tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };

        pulseaudio = {
          format = " {icon} {volume}%";
	  format-muted = " {icon}";
	  format-icons.default = [ "" "" "" ];
	  format-icons.muted = [ "" ];
        };

        backlight = {
          format = " {icon} {percent}%";
	  format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" "" ];
        };

        battery = {
          states = {
	    warning = 30;
	    critical = 10;
	  };
	  format = " {icon} {capacity}%";
	  format-charging = " {icon} {capacity}%";
	  format-plugged  = " {icon} {capacity}%";
	  format-full     = " {icon} AC";
	  format-icons.default = [ "" "" "" "" "" ];
  	  format-icons.full = [ "󰚥" ];
       };

       network = {
         format-wifi = " {icon} {essid}";
         format-ethernet = " {icon} {ipaddr}";
         format-disconnected = " {icon}";
         tooltip-format = "{ifname}: {ipaddr}\nSSID: {essid}\nStrength: {signalStrength}%";
         format-icons.wifi = [ "󰤟" "󰤢" "󰤥" "󰤨" ];
         format-icons.ethernet = [ "󰈀" ];
         format-icons.dissconnected = [ "󰣼" ];
       };

       tray = {
         spacing = 8;
         icon-size = 16;
       };
      }];
     };

      xdg.configFile."waybar/style.css".source = ./style.css;
  };
}
