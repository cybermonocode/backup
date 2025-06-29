{ config, lib, pkgs, ... }:

{
  # All hardware configuration

  ## Nvidia driver
  boot.kernelModules = [ "nouveau" ];
  boot.initrd.kernelModules = [ "nouveau" ];

  # Enable this when you abandon wayland ;)
  # services.xserver = {
  #   enable = true;
  #   videoDrivers = [ "nouveau" ];
  #   excludePackages = [ pkgs.xterm ];
  # };

  hardware.graphics = {
    enable = true;
    # driSupport = true; # It has no effect can be removed.
    package = pkgs.mesa;
    extraPackages = [ pkgs.mesa ];
  };

  hardware.enableRedistributableFirmware = true;

  # services.powerManagement.powertop.enable = true; # It exists before but now no.

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # For Electron apps to use Wayland
    WLR_NO_HARDWARE_CURSORS = "1"; # If you experience cursor issues
    GBM_BACKEND = "mesa-drm";
    __GLX_VENDOR_LIBRARY_NAME = "mesa";
    # ... (other variables from Hyprland section)
    LIBVA_DRIVER_NAME = "nouveau"; # For VA-API video acceleration
    VDPAU_DRIVER = "nouveau"; # For VDPAU video acceleration
  };

  ## Sound control
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  ## Enable pringting
  services.printing.enable = true;

  ## Enable touchpad support and set mouse acceleration
  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
      #services.libinput.mouse.accelProfile = "custom";
      #services.libinput.mouse.accelSpeed = "-0.5";
      #services.libinput.mouse.accelPointsScroll = [ 0.0 ];
      #services.libinput.mouse.accelPointsMotion = [ 0.0 ];
      #services.libinput.mouse.accelPointsFallback = [ 0.0 ];
      #services.libinput.mouse.accelStepScroll = 0.1;
      #services.libinput.mouse.accelStepMotion = 0.1;
      #services.libinput.mouse.accelStepFallback = 0.1;
    };
    touchpad = {
      accelProfile = "flat";
    };
  };

  # Removable drivers and storage devices
  services.upower.enable = true;
  services.udisks2.enable = true;

}

