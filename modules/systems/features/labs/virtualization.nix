{ ... }: {
  flake.nixosModules.labs-virtualization = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.labs.virtualization;
      username = config.nixos.mainUser;
    in {
      options.nixos.labs.virtualization = {
        enable = lib.mkEnableOption "Lab Virtualization (KVM/libvirt/Docker/OVS)";

        nestedVirt = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable nested KVM virtualization";
        };

        cpuVendor = lib.mkOption {
          type = lib.types.enum [ "intel" "amd" ];
          default = "intel";
          description = "CPU vendor: 'intel' or 'amd'";
        };
      };

      config = lib.mkIf cfg.enable {
        # KVM / libvirt Virtualization
        virtualisation.libvirtd = {
          enable = true;
          qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
          };
        };
        programs.virt-manager.enable = true;

        # Docker support
        virtualisation.docker = {
          enable = true;
          autoPrune.enable = true;
        };

        # OpenVSwitch Switch support
        virtualisation.vswitch.enable = true;

        # Nested Virtualization configuration
        boot.extraModprobeConfig = lib.mkIf cfg.nestedVirt (
          if cfg.cpuVendor == "intel"
          then "options kvm_intel nested=1"
          else "options kvm_amd nested=1"
        );

        # System virtualization packages
        environment.systemPackages = with pkgs; [
          qemu
          qemu-utils
          virt-manager
          virt-viewer
        ];

        # User Groups integration
        users.users.${username}.extraGroups = [
          "kvm"
          "libvirtd"
          "docker"
        ];
      };
    };
}
