{ self, inputs, ... }: {
  flake.homeModules.lann = { config, lib, pkgs, ... }: {
    imports = [
      self.homeModules.lann-niri
      self.homeModules.lann-waybar
    ];

    home.username = "lann";
    home.homeDirectory = "/home/lann";
  };
}
