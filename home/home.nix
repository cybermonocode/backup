{ config, pkgs, lib, ... }:

{
  imports = [
    ./ghostty.nix
    ./hyprland.nix
    ./hyprpanel.nix
    ./stylix.nix
  ];
  home = {
    username = "astronomia";
    homeDirectory = "/home/astronomia";
    packages = with pkgs; [
      # Wayland necessary
      brightnessctl
      gammastep
      rofi-wayland
      hyprpicker
      hypridle
      hyprlock
      hyprpanel

      # Themes
      catppuccin
      catppuccin-cursors
      nerd-fonts.symbols-only

      # Office adn editor
      #libreoffice-fresh
#      kdePackages.dolphin
#      kdePackages.dolphin-plugins
#      kdePackages.okular
#      kdePackages.kate
#      kdePackages.gwenview 
    ];

    stateVersion = "25.11";
  };

  # System font and cursor theme setting.
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Atkinson Hyperlegible Next" ];
      sansSerif = [ "Atkinson Hyperlegible Next" ];
      monospace = [ "Atkinson Hyperlegible Mono" ];
    };
  };
  home.pointerCursor = {
    enable = true;
#    name = "catppuccin-mocha-rosewater-cursors";
#    package = pkgs.catppuccin-cursors.mochaRosewater;
    size = 51;
    dotIcons.enable= true;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor.enable = true;
    hyprcursor.size = 31;
  };

  # gammastep
  services.gammastep = {
    enable = true;
    tray = true;
    provider = "manual";
    dawnTime = "06:00";
    duskTime = "20:00";
    temperature = {
      day = 5000;
      night = 2300;
    };
  };

}
