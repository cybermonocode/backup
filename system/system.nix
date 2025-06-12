{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardwares.nix
    ./network.nix
    ./user.nix
    ./wayland.nix
  ];
}
