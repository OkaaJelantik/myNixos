# Considered for refractions
{ self, inputs,  ... }: {
    flake.nixosModules.common = { config, lib, pkgs, ... }: {
      options.nixos.mainUser = lib.mkOption {
        type = lib.types.str;
        default = "lann";
        description = "Main user of the system";
      };

      config = {
        environment.systemPackages = with pkgs; [
          git
          vim
          wget
          curl
          btop
          age 
          inputs.agenix.packages.${pkgs.system}.default
          inputs.home-manager.packages.${pkgs.system}.home-manager
        ];
      };
    };
  }
