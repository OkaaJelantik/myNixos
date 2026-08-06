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

    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    programs.zsh.enable = true;

    users.users.lann = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
      shell = pkgs.zsh;
      home = "/home/lann";
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
	        command = "${pkgs.niri}/bin/niri-session";  # bukan tuigreet
	        user = "lann";
	      };
	      default_session = {
	        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
	      }; 
      };
    };

<<<<<<< HEAD
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [ "corefonts" ];

    fonts.packages = with pkgs; [ corefonts ];
  
=======
    programs.kdeconnect.enable = true;
    services.upower.enable = true;
    services.udisks2.enable = true;

    fileSystems."/home/lann/disk" = {
      device = "dev/sda1";
      fsType = "exfat";
      options = [ "users" "nofail" "uid=1000" "gid=100" "dmask=007" "fmask=117" ];
    };

    environment.sessionVariables = {
      QT_STYLE_OVERRIDE = "adwaita-dark";
    };

    environment.systemPackages = with pkgs; [
      adwaita-qt
      adwaita-qt6
      upower
      sshfs
    ];
>>>>>>> fe73437 (setting flashdisk buat musik)
  };
}
