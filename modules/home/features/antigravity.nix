{ inputs, pkgs, ... }: {
  flake.homeModules.antigravity = { pkgs, ... }: {
    home.packages = [
      inputs.antigravity-nix.packages.${pkgs.system}.google-antigravity-no-fhs
      inputs.antigravity-nix.packages.${pkgs.system}.google-antigravity-cli
    ];
  };
}
