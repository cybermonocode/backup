{ config, lib, pkgs, ... }:

{
  # KDE desktop environment
  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.elisa
    kdePackages.plasma-welcome
    kdePackages.plasma-systemmonitor
    kdePackages.neochat
    kdePackages.kweather
    kdePackages.kweathercore
    kdePackages.kwalletmanager
    kdePackages.kwallet-pam
    kdePackages.kwallet
    kdePackages.kpeople
    kdePackages.korganizer
    kdePackages.konversation
    kdePackages.kontactinterface
    kdePackages.kontact
    kdePackages.konsole
    kdePackages.konquest
    kdePackages.konqueror
    kdePackages.kongress
    kdePackages.kmines
    kdePackages.kmailtransport
    kdePackages.kmail-account-wizard
    kdePackages.kmail
    kdePackages.kmahjongg
    kdePackages.kcontacts
    kdePackages.kcalc
    kdePackages.kajongg
    kdePackages.kaddressbook
    kdePackages.dragon
    kdePackages.discover
    kdePackages.akregator
    kdePackages.akonadi
    
  ];

}

