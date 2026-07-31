{ self, inputs, ... }: {

  flake.nixosModules.seirios-configuration = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.seirios-hardware-configuration
    ];

    networking.hostName = "seirios";
    time.timeZone = "Asia/Makassar";
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    programs.zsh.enable = true;

    users.users.lann = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
      shell = pkgs.zsh;
      home = "/home/lann";
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
          user = "greeter";
        };
	initial_sesssion = {
	  command = "niri-session";
	  user = "lann";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      upower
    ];
  };
}
