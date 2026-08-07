{ self, inputs, ... }: {

  flake.nixosModules.hosts-laptop = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.hw-laptop
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.networkmanager.enable = true;
    networking.hostName = "seirios";
    time.timeZone = "Asia/Makassar";

    i18n.defaultLocale = "en_US.UTF-8";

    users.users.lann = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" "aria" ];
      home = "/home/lann";
    };

    environment.systemPackages = with pkgs; [
      git
      vim
      wget
      htop
      inputs.home-manager.packages.${pkgs.system}.home-manager
    ];

    system.stateVersion = "26.05";
  };
}
