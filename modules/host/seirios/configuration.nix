{ self, inputs, ... }: {

  flake.nixosModules.seirios-configuration = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.seirios-hardware-configuration
      self.nixosModules.common
      self.nixosModules.desktop
    ];

    networking.hostName = "seirios";
    time.timeZone = "Asia/Makassar";

    users.users.lann = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
      shell = pkgs.bash;
      home = "/home/lann";
    };

    services.greetd.settings.initial_session = {
      command = "niri-session";
      user = "lann";
    };
  };

}
