{ self, inputs, ... }: {

  flake.nixosModules.hosts-laptop = { config, lib, pkgs, ... }: {
    imports = [
      self.nixosModules.hw-laptop
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.networkmanager.enable = true;
    networking.hostName = "seirios";
    time.timeZone = "Asia/Makassar";

    i18n.defaultLocale = "en_US.UTF-8";

    users.users.lann = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" "audio"];
      home = "/home/lann";
      shell = pkgs.zsh;
    };
    programs.zsh.enable = true;

    system.stateVersion = "26.05";
  };
}
