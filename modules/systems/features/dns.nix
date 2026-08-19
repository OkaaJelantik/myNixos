{ ... }: {
  flake.nixosModules.dns = { config, lib, pkgs, ... }:
    let
      cfg = config.nixos.dns;

      providers = {
        cloudflare = {
          nameservers = [
            "1.1.1.1#one.one.one.one"
            "1.0.0.1#one.one.one.one"
          ];
          resolvedSettings = {
            DNSSEC = "true";
            Domains = [ "~." ];
            FallbackDNS = [
              "1.1.1.1#one.one.one.one"
              "1.0.0.1#one.one.one.one"
            ];
          };
        };
        nextdns = {
          nameservers = [
            "45.90.28.0#cf2869.dns.nextdns.io"
            "2a07:a8c0::#cf2869.dns.nextdns.io"
            "45.90.30.0#cf2869.dns.nextdns.io"
            "2a07:a8c1::#cf2869.dns.nextdns.io"
          ];
          resolvedSettings = { };
        };
      };
    in {
      options.nixos.dns = {
        enable = lib.mkEnableOption "DNS-over-TLS configuration";
        provider = lib.mkOption {
          type = lib.types.enum [ "cloudflare" "nextdns" ];
          default = "cloudflare";
          description = "DNS provider for DoT via systemd-resolved";
        };
      };

      config = lib.mkIf cfg.enable {
        networking.nameservers = providers.${cfg.provider}.nameservers;

        services.resolved = {
          enable = true;
          settings.Resolve = {
            DNSOverTLS = "yes";
          } // providers.${cfg.provider}.resolvedSettings;
        };
      };
    };
}
