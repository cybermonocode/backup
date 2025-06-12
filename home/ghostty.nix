{ config, pkgs, lib, ... }:

{
  # Bash shell control.
  programs.bash = {
    enable = true;
    shellAliases = {
      astronomia = "echo Non est ad astra mollis e terris via. Stay hungry, stay foolish.";
      sudonrs = "sudo nixos-rebuild switch";
      sudonrt = "sudo nixos-rebuild test";
    };
    bashrcExtra = ''
      unset HISTFILE
    '';
  };

  # Bat configuraton.
  programs.bat = {
    enable = true;
    config = {
      # theme = "Dracula";
      style = "full";
      paging = "auto";
    };
  };

  # Ghostty configuration.
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      shell-integration-features = "no-cursor";
      cursor-style = "block";
      cursor-style-blink = false;
      cursor-text = "#000000";
      font-family = "Atkinson Hyperlegible Mono";
      font-size = 17;
      background-opacity = 0.9;
      theme = "catppuccin-mocha";
    };
  }; 
}
