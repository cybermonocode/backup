{ config, pkgs, lib, ... }:

{
  imports = [
    ./device/hardwares.nix
    ./device/network.nix
    ./desktop/user.nix
    ./desktop/wayland.nix
  ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Systemlib
    libblockdev
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

}
