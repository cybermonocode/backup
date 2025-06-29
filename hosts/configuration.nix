{ config, lib, pkgs, ... }:

#let
#  home-manager = builtins.fetchTarball {
#    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
#    sha256 = "1xrkf5dcp5z8ahw03vzybcdv561aw72ja8ca4fdwf4mngm5q0xaz";
#    };
#in

{
  imports =
    [ 
      #(import "${home-manager}/nixos")
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Split other system options.
      ../system/system.nix
    ];

  #home-manager = {
  #  useUserPackages = true;
  #  useGlobalPkgs = true;
  #  backupFileExtension = "backup";
  #  users.astronomia = import ../home/home.nix;
  #};

  # Flakes and other nix commands.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  # Systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/4932724f-b882-40c2-b9ac-dd854948d864";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}

