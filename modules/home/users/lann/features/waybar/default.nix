{ self, inputs, ... }: {
  flake.homeModules.lann-waybar = { config, lib, pkgs, ... }: {

    programs.waybar = {
      enable = true;

      settings = [{
        layer = "top";
        position = "top";
        height = 36;
        spacing = 6;
        exclusive = true;

        modules-left   = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right  = [ "pulseaudio" "backlight" "battery" "network" "tray" ];

        "niri/workspaces" = {
          format = "{index}";
          on-click = "activate";
        };

        "niri/window" = {
          max-length = 40;
          separate-outputs = true;
        };

        clock = {
          format = "  {:%H:%M}";
          format-alt = "  {:%A, %d %B %Y}";
          tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        };

        pulseaudio = {
          format = "{icon}  {volume}%";
          format-muted = "  Muted";
          format-icons.default = [ "" "" "" ];
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        };

        backlight = {
          format = "{icon}  {percent}%";
          format-icons = [ "" "" "" "" "" "" ];
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = "brightnessctl set 5%-";
        };

        battery = {
          states = {
            warning = 30;
            critical = 10;
          };
          format = "{icon}  {capacity}%";
          format-charging = "  {capacity}%";
          format-plugged  = "  {capacity}%";
          format-icons    = [ "" "" "" "" "" ];
        };

        network = {
          format-wifi = "  {essid}";
          format-ethernet = "  {ipaddr}";
          format-disconnected = "  Disconnected";
          tooltip-format = "{ifname}: {ipaddr}\nSSID: {essid}\nStrength: {signalStrength}%";
        };

        tray = {
          spacing = 8;
          icon-size = 16;
        };
      }];

      style = ''
        @import url("style.css");
      '';
    };

    # Waybar style.css
    xdg.configFile."waybar/style.css".source = ./style.css;
  };
}
