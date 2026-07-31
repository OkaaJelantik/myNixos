{ self, inputs, ... }: {

  flake.nixosModules.seirios-configuration = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.seirios-hardware-configuration
      self.nixosModules.common
      self.nixosModules.niri-desktop-unstable
    ];

    networking.hostName = "seirios";
    time.timeZone = "Asia/Makassar";

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
  };
}
