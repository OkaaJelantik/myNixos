{ pkgs, ... }: {
  wsl = {
    enable = true;
    defaultUser = "lann";
    startMenuLaunchers = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos-wsl";
  time.timeZone = "Asia/Makassar";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.lann = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  system.stateVersion = "26.05";
}
