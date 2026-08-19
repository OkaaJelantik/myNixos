{ ... }: {
    flake.homeModules.unmanaged = { pkgs, ... }: {
      home.packages = with pkgs; [
        pavucontrol
        unzip
      ];
  };
}
