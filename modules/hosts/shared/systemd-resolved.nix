{ ... }: {
  flake.nixosModules.dns-cloudflare = { config, ... }: {

    networking.nameservers = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
    
    services.resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [ "1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one" ];
      dnsovertls = "true";
    };
  };

  flake.nixosModules.dns-nextdns = { config, ... }: {
    networking.nameservers = [
      "45.90.28.0#cf2869.dns.nextdns.io"
      "2a07:a8c0::#cf2869.dns.nextdns.io"
      "45.90.30.0#cf2869.dns.nextdns.io"
      "2a07:a8c1::#cf2869.dns.nextdns.io"
    ];

    services.resolved = {
      enable = true;
      dnsovertls = "true";
    };
  };
}

