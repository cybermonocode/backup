{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    #systemd = {
    #  enable = false;
    #  variables = [
    #    "--all"
    #  ];
    #};
    settings = {
      group = {
        groupbar = {
          enabled = true;
          font_family = "Atkinson Hyperlegible Next";
          font_size = 17;
        };
      };

      ################
      ### MONITORS ###
      ################

      monitor = [ ", 1920x1080@60, auto, 1" ];

      ###################
      ### MY PROGRAMS ###
      ###################

      # Set programs that you use
        "$terminal" = "ghostty";
        "$fileManager" = "dolphin";
        "$menu" = "rofi -show drun";
        "$lock" = "hyprlock";
      #################
      ### AUTOSTART ###
      #################

      exec-once = [
        "$terminal"
        "gammastep"
        "hyprpanel"
        "hypridle"
        #"nm-applet &"
        #"dbus-update-activation-environment --systemd --all &"
        #"systemctl --user enable --now hyprpaper.service &"
        #"systemctl --user enable --now hypridle.service &"
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      env = [
        "XCURSOR_SIZE,31"
        "HYPRCURSOR_SIZE,31"
        "HYPRCURSOR_THEME,catppuccin-mocha-rosewater-cursors"
      ];

      ###################
      ### PERMISSIONS ###
      ###################
      
      # See https://wiki.hyprland.org/Configuring/Permissions/
      # Please note permission changes here require a Hyprland restart and are not applied on-the-fly
      # for security reasons
      
      # ecosystem {
      #   enforce_permissions = 1
      # }
      
      # permission = /usr/(bin|local/bin)/grim, screencopy, allow
      # permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow
      # permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

      #####################
      ### LOOK AND FEEL ###
      #####################

      general = {
        gaps_in = 0;
        gaps_out = 0;
        border_size = 1;
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };
      decoration = {
        rounding = 0;
        rounding_power = 4.0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = false;
          range = 3;
          render_power = 3;
        # color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = false;
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
      # "Smart gaps" / "No gaps when only"
      # uncomment all if you wish to use that.
      # workspace = w[tv1], gapsout:0, gapsin:0
      # workspace = f[1], gapsout:0, gapsin:0
      # windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
      # windowrule = rounding 0, floating:0, onworkspace:w[tv1]
      # windowrule = bordersize 0, floating:0, onworkspace:f[1]
      # windowrule = rounding 0, floating:0, onworkspace:f[1]
      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        #vfr = true;
        #disable_hyprland_logo = true;
        #disable_splash_rendering = true;
        #disable_autoreload = true;
        #focus_on_activate = true;
        #new_window_takes_over_fullscreen = 2;
        font_family = "Atkinson Hyperlegible Next";
        splash_font_family = "Atkinson Hyperlegible Next";
        force_default_wallpaper = 1;
        disable_hyprland_logo = true;
      };

      #############
      ### INPUT ###
      #############

      input = {
        kb_layout = "us";
        # kb_variant = :
        # kb_model = ;
        # kb_options = ;
        # kb_rules = ;
        follow_mouse = 1;
        # sensitivity = -1.0; # -1.0 - 1.0, 0 means no modification.
        # accel_profile = "flat";
        repeat_delay = 300;
        repeat_rate = 50;
        numlock_by_default = true;

        #touchpad = {
        #  natural_scroll = false;
        #  #clickfinger_behavior = true;
        #};
      };
      gestures = { workspace_swipe = false; };
      
      ###################
      ### KEYBINDINGS ###
      ###################

        "$mainMod" = "SUPER";
        #"$shiftMod" = "SUPER_SHIFT";
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, B, exec, mullvad-browser"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo," # dwindle
        "$mainMod, J, togglesplit," # dwindle
        "$mainMod, L, exec, $lock"
        # ", Print, exec, grimblast copy area"
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        # Laptop multimedia keys for volume and LCD brightness
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];
      bindl = [
        # Requires playerctl
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules
      # Example windowrule
      # windowrule = float,class:^(kitty)$,title:^(kitty)$
      # Ignore maximize requests from apps. You'll probably like this.
      windowrule = [ "suppressevent maximize, class:.*" ];
      # Fix some dragging issues with XWayland
      # windowrule = [ "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" ];
    };

#      input {
#        sensitivity = -1.0 # -1.0 - 1.0, 0 means no modification.
#        accel_profile = "flat"
#      }
#    device {
#        name = cherry-cherry-wireless-device-mouse
#        sensitivity = -1.0
#        accel_profile = "flat"
#      }
#     device {
#        name = cherry-cherry-wireless-device-consumer-control-1
#        sensitivity = -1.0
#        accel_profile = "flat"
#     }
#     device {
#        name = elan0774:00-04f3:3244-mouse
#        sensitivity = -1.0
#        accel_profile = "flat"
#     }

    extraConfig = ''
      misc {
        font_family = Atkinson Hyperlegible Next
        splash_font_family = Atkinson Hyperlegible Next
      }
      device {
        name = cherry-cherry-wireless-device-mouse
        sensitivity = -3.0
        accel_profile = "flat"
      }
      device {
        name = elan0774:00-04f3:3244-touchpad
        sensitivity = -0.7
        accel_profile = "flat"
      }
    '';
  };
}
