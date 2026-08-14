{ self, ... }: {
  flake.nixosModules.labs-terminal = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.labs.terminal;
    in {
      options.nixos.labs.terminal = {
        enable = lib.mkEnableOption "Lab Terminal Emulator Clients (Putty / Minicom)";
      };

      config = lib.mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
          putty              # GUI SSH/Telnet/Serial client
          minicom            # Serial console
        ];
      };
    };
}
