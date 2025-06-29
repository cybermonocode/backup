{ config, pkgs, ... }:

{
  # Hyprpanel
  programs.hyprpanel = {
    enable = true;
    systemd.enable = true; # Automatically restart HyprPanel with systemd.
    hyprland.enable = true;
    overwrite.enable = true;
    #overlay.enable = true;

    # Override the final config with an arbitrary set. Useful for overriding colors in your selected theme. Default: {}
    # For example to see https://github.com/anotherhadi/nixy/blob/main/home/system/hyprpanel/default.nix
    #override = {
    #  theme.bar.menus.text = "#123ABC";
    #};

    settings = {
      layout = {
        "bar.layouts" = {
          "1" = {
            "left" = [ "dashboard" "workspaces" "windowtitle" ];
            "middle" = [ "media""cava" ];
            "right" = [
              "systray"
              "volume"
              "bluetooth"
              "battery"
              "network"
              "clock"
              "notifications"
            ];
          };
        };
      };

      bar = {
        launcher.autoDetectIcon = true;
        autoHide = "single-window";
        clock = {
          format = "%A %d %B %Y %H:%M";
          showIcon = true;
          showTime = true;
        };
        workspaces = {
          icons.active = "";
          icons.available = "";
          icons.occupied = "";
          # ignored = mkStrOption "";
          # monitorSpecific = true;
          #numbered_active_indicator = "underline";
          #reverse_scroll = false;
          #scroll_speed = 1;
          #showAllActive = true;
          #showApplicationIcons = false;
          #showWsIcons = false;
          #show_icons = false;
          #show_numbered = true;
          #spacing = 1.0;
          #workspaceMask = false;
          #workspaces = 5;
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          # weather.unit = "metric";
        };
        dashboard = {
          directories.enabled = false;
          stats.enable_gpu = true;
        };
      };

      theme = {
        name = "catppuccin_mocha";
        bar = {
          transparent = true;
          location = "top";
        };
        font = {
          name = "Atkinson Hyperlegible Next";
          size = "17px";
        };
      };
      
      #theme.bar.outer_spacing = "0px";
      #  # if floating && transparent then "0px" else "8px";
      #theme.bar.buttons.y_margins = "0px";
      #  # if floating && transparent then "0px" else "8px";
      #theme.bar.buttons.spacing = "0.3em";
      #theme.bar.buttons.radius = "rounding";
      #  # (if transparent then toString rounding else toString (rounding - 8)) + "px";
      #theme.bar.floating = true;
      #theme.bar.buttons.padding_x = "0.8rem";
      #theme.bar.buttons.padding_y = "0.4rem";

      ##theme.bar.margin_top =
      ##  (if position == "top" then toString (gaps-in * 2) else "0") + "px";
      ##theme.bar.margin_bottom =
      ##  (if position == "top" then "0" else toString (gaps-in * 2)) + "px";
      ##theme.bar.margin_sides = toString gaps-out + "px";
      ##theme.bar.border_radius = toString rounding + "px";
      #theme.bar.location = "top";
      #theme.bar.dropdownGap = "4.5em";
      #theme.bar.menus.shadow = "0 0 0 0";
      #  # if transparent then "0 0 0 0" else "0px 0px 3px 1px #16161e";
      #theme.bar.buttons.style = "default";
      #theme.bar.buttons.monochrome = true;
      #theme.bar.menus.monochrome = true;
      ##theme.bar.menus.card_radius = toString rounding + "px";
      ##theme.bar.menus.border.size = toString border-size + "px";
      ##theme.bar.menus.border.radius = toString rounding + "px";
      #theme.bar.menus.menu.media.card.tint = 90;

      #bar.workspaces.show_numbered = true;
      #bar.workspaces.workspaces = 10;
      #bar.workspaces.numbered_active_indicator = "color";
      #bar.workspaces.monitorSpecific = false;
      #bar.workspaces.applicationIconEmptyWorkspace = "";
      #bar.workspaces.showApplicationIcons = true;
      #bar.windowtitle.label = true;
      #bar.volume.label = false;
      #bar.network.truncation_size = 12;
      #bar.bluetooth.label = false;
      #bar.clock.format = "%a %b %d  %I:%M %p";
      #bar.notifications.show_total = true;
      #bar.media.show_active_only = true;
      #bar.customModules.updates.pollingInterval = 1440000;
      #bar.customModules.cava.showIcon = false;
      #bar.customModules.cava.stereo = true;
      #bar.customModules.cava.showActiveOnly = true;

      #notifications.position = "top right";
      #notifications.showActionsOnHover = true;
      #theme.notification.opacity = 90;
      #theme.notification.enableShadow = true;
      #theme.notification.border_radius = toString rounding + "px";
      
      #theme.osd.enable = true;
      #theme.osd.orientation = "vertical";
      #theme.osd.location = "left";
      #theme.osd.radius = toString rounding + "px";
      #theme.osd.margins = "0px 0px 0px 10px";
      #theme.osd.muted_zero = true;

      #menus.clock.weather.location = "Berlin";
      #menus.clock.weather.unit = "metric";
      #menus.dashboard.powermenu.confirmation = false;
      ## menus.dashboard.powermenu.avatar.image = "~/.face.icon";

      menus.dashboard.shortcuts.left.shortcut1.icon = "";
      menus.dashboard.shortcuts.left.shortcut1.command = "mullvad-browser";
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Mullvad-Browser";
      menus.dashboard.shortcuts.left.shortcut3.icon = "󰖔";
      menus.dashboard.shortcuts.left.shortcut3.command = "night-shift";
      menus.dashboard.shortcuts.left.shortcut3.tooltip = "Night-shift";
      menus.dashboard.shortcuts.left.shortcut4.icon = "";
      menus.dashboard.shortcuts.left.shortcut4.command = "menu";
      menus.dashboard.shortcuts.left.shortcut4.tooltip = "Search Apps";
      menus.dashboard.shortcuts.right.shortcut1.icon = "";
      menus.dashboard.shortcuts.right.shortcut1.command = "hyprpicker -a";
      menus.dashboard.shortcuts.right.shortcut1.tooltip = "Color Picker";
      menus.dashboard.shortcuts.right.shortcut3.icon = "󰄀";
      menus.dashboard.shortcuts.right.shortcut3.command =
        "screenshot region swappy";
      menus.dashboard.shortcuts.right.shortcut3.tooltip = "Screenshot";

      #menus.power.lowBatteryNotification = true;

      #wallpaper.enable = false;
    };
  };

}
