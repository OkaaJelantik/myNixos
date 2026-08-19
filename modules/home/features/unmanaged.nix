{ pkgs, ... }: {
    flake.homeModules.unmanaged = { ... }: {
      home.packages = with pkgs; [
        pavucontrol
        unzip
      ];
  };
}
