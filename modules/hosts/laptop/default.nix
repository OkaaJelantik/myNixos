{ self, inputs, ... }: {
  flake.nixosConfigurations.seirios = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      # General
      self.nixosModules.hosts-laptop
      self.nixosModules.systems-features
      self.nixosModules.labs
      inputs.agenix.nixosModules.default
      # Etc
      self.nixosModules.wm-niri
      
      {
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

        # Utility
        nixos.aria2 = {
            enable = true;
            daemon = true;
        };
        
        # Niri WM 
        nixos.niri = {
          enable = true;
          package = "main";
          autologin = true;
          xsupport = true;
        };
      }

      {
        # ===== Services ===== # 
        services.power-profiles-daemon.enable = true;
        services.upower.enable = true;
        services.udisks2.enable = true;
        services.openssh.enable = true;
        # ==================== #
      }
    ];
  };
}
