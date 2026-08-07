{ self, inputs, ... }: {
  flake.nixosModules.systems-features = { config, lib, pkgs, ... }: {
    imports = [
      # Essentials for any machine
      self.nixosModules.common
      # Audio backend - pipewire (opt: enable [bool])
      self.nixosModules.pipewire
      # DoT, resolved (opts: enable [bool], provider [cloudflare, nextdns])
      self.nixosModules.dns
      # Bluetooth backend (opts: enable [bool], onBoot [bool])
      self.nixosModules.bluetooth
    ];

    /* NOTES 
    for desktop usage, import wm-niri module manualy.
    */
  };
}
