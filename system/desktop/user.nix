{ config, lib, pkgs, ... }:

{

  # Set time zone internationalisation properties.
  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };
      
  # Define a user account.
  users.users.astronomia = {
    isNormalUser = true;
    description = "Astronomia";
    extraGroups = [ "networkmanager""wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      # Do nothing
    ];
  };

}

