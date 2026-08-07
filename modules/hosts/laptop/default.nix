{ self, inputs, ... }: {
  flake.nixosConfigurations.seirios = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      # General
      self.nixosModules.hosts-laptop
      self.nixosModules.systems-features
      # Etc
      self.nixosModules.wm-niri # unstable branch
    ];
    
    # ===== Modules Options ===== #

    # Hardwares
    nixos.pipewire.enable = true;
    nixos.bluetooth = {
      enable = true;
      onBoot = false;
    };

    # Networking
    nixos.dns = {
      enable = true;
      provider = "cloudflare";
    };

    # =========================== #


    # ===== Services ===== # 

    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;
    services.aria2.enable = true;
    services.udisks2.enable = true;

    # ==================== #
  };
}
