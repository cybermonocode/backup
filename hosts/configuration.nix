{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/master.tar.gz";
    sha256 = "14qg6fs7rscbf368jialqwqz6ysagkhvpcz16zs0arrxhhvngpap";
    };
in

{
  imports =
    [ 
      (import "${home-manager}/nixos")
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Split other system options.
      ../system/system.nix
    ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.astronomia = import ../home/home.nix;
  };

  # Flakes and other nix commands.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  # Systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.luks.devices."cryptswap".device = "/dev/disk/by-uuid/6e01e658-f618-44af-9cb4-7d21ad0e28dc";

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # System tools
    git
    bat
    tree
    wget2
    # Editors
    vim
    neovim
    emacs
    # Terminal emulator and tools
    btop
    yazi
    ghostty
    # Web Browser
    mullvad-browser
  ];

  # Fonts management.
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-lgc-plus
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      atkinson-hyperlegible-next
      atkinson-hyperlegible-mono
    ];
  };
  console = {
    packages = [ pkgs.terminus_font ];
    keyMap = "us";
  };

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

