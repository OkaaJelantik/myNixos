{ self, inputs, ... }: {
  
  flake.nixosModules.common = { config, lib, pkgs, ... }: {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.networkmanager.enable = true;

    i18n.defaultLocale = "en_US.UTF-8";

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
