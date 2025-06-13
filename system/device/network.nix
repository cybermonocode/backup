{ config, lib, pkgs, ... }:

{

  # All networking configuration.
  networking = {
    hostName = "nixos";
    nameservers = [ "194.242.2.9#all.dns.mullvad.net" ];
    firewall = {
      enable = true;
    };
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      wifi.scanRandMacAddress = true;
      ethernet.macAddress = "random";
      dns = "systemd-resolved";
    };
  };

  # DNS services.
  services = {
    doh-server = {
      enable = true;
      settings.upstream = [ "udp:194.242.2.9#all.dns.mullvad.net" ];
    };
    resolved = {
      enable = true;
      dnssec = "false";
      dnsovertls = "true";
      domains = [ "~." ];
      fallbackDns = [ "194.242.2.9#all.dns.mullvad.net" ];
    };
  };

}

