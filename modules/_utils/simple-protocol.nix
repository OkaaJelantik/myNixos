{ ... }: {
  flake.nixosModules.simple-protocol = { config, ... }: {

    networking.firewall.allowedTCPPorts = [ 4711 ];

    services.pipewire.extraConfig.pipewire."92-protocol-simple" = {
      "context.modules" = [
      {
        name = "libpipewire-module-protocol-simple";
        args = {
          capture = true;
          #playback = true;

          audio.rate = 44100;
          audio.format = "S16LE";
          audio.channels = 2;
          audio.position = [ "FL" "FR" ];

          "server.address" = [ "tcp:4711" ];

          "capture.props" = {
            "target.object" = "alsa_output.pci-0000_00_1f.3.analog-stereo";
            "stream.capture.sink" = true;
            #"media.class" = "Audio/Sink";
          };

          #"playback.props" = {
            # "target.object" = null;
            # "media.class" = "Audio/Sink";
          #};
        };
      }
      ];
    };

  };
}
