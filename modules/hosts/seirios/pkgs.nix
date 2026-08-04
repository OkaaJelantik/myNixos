{ inputs, ... }: {
  flake.nixosModules.seirios-pkgs = { pkgs, ... }: {
   
   environment.systemPackages = with pkgs; [
      easyeffects
      onlyoffice-desktopeditors
    ];
  };
}
