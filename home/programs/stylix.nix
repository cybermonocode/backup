{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = pkgs.fetchurl {
      url = "https://upload.wikimedia.org/wikipedia/commons/4/49/%22The_School_of_Athens%22_by_Raffaello_Sanzio_da_Urbino.jpg";
      hash = "sha256-o1GwucQp2D5x6ZLffTpDN3XDfhisRu9vZjUgsHWxfvQ=";
    };
    cursor = {
      name = "catppuccin-mocha-rosewater-cursors"; # "Bibata-Modern-Ice";
      package = pkgs.catppuccin-cursors.mochaRosewater; # pkgs.bibata-cursors;
      size = 51;
    };
    fonts = {
      serif = {
        package = pkgs.atkinson-hyperlegible-next;
        name = "Atkinson Hyperlegible Next";
      };

      sansSerif = {
        package = pkgs.atkinson-hyperlegible-next;
        name = "Atkinson Hyperlegible Next";
      };

      monospace = {
        package = pkgs.atkinson-hyperlegible-mono;
        name = "Atkinson Hyperlegible Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        desktop = 17;
        applications = 17;
        popups = 17;
        terminal = 17;
      };
    };
  };
}
