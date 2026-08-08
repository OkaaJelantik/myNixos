# Considered for refractions
{ self, inputs,  ... }: {
    flake.nixosModules.common = { pkgs, ... }: {
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
  }
