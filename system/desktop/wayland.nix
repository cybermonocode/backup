{ config, lib, pkgs, ... }:

{
  # Wayland environment
  services.displayManager.ly.enable = true;
  programs = {
    hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
    xwayland.enable = true;
  };

  # HyprEcosystem
  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

}

