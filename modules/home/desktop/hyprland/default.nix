{ pkgs, ... }:
{
  imports = [
    ./hyprpaper.nix
    # ./hyprlock.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$tuiFM" = "yazi";
      "$menu" = "fuzzel";
      "$browser" = "firefox";

      exec-once = [ "waybar" ];

      monitor = [ "DP-5,2560x1440@165.00hz,0x0,1"
                  "HDMI-A-3, 1920x1080@60.00hz,2560x0,1"];

      gestures = {
        workspace_swipe = false;
      };

      input = {
        kb_layout = "us";
        kb_options = "caps:escape";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgb(e78a4e)";
        "col.inactive_border" = "rgb(928374)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
        };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgb(1d2021)";
        };
      };

      animations.enabled = false;

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Adwaita"
        "GTK_THEME,Tokyonight-Dark-BL-LB"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
      ];

      windowrule = [ ];

      windowrulev2 = [ "noblur,title:^()$,class:^()$" ];

      bind = [
        "$mainMod, return, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, F, exec, $browser"
        "CTRL ALT, delete, exit,"
        "$mainMod, E, exec, $guiFM"
        "$mainMod SHIFT, E, exec, $terminal -e $tuiFM"
        "$mainMod, V, togglefloating,"
        "$mainMod, D, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, U, togglesplit,"
        "$mainMod SHIFT, P, exec, pavucontrol"
        "$mainMod, M , exec, pamixer --default-source -t" # mute mic
        "$mainMod SHIFT, M , exec, pamixer -t" # mute sound
        "$mainMod, F7, exec, playerctl previous"
        "$mainMod, F8, exec, playerctl next"
        "$mainMod, F9 , exec, playerctl play-pause"
        "$mainMod, F10 , exec, playerctl volume 0.05-"
        "$mainMod, F11 , exec, playerctl volume 0.05+"
        "$mainMod, F12, exec, playerctl stop"
        "$mainMod, N, exec, $terminal -e rmpc"
        "$mainMod, Y, exec, ytmpv"
        "$mainMod SHIFT, Y, exec, ytdl"

        "$mainMod SHIFT, period, exec, mullvad connect"
        "$mainMod ALT, period, exec, mullvad disconnect"

        # Screenshot bindings
        "$mainMod ALT, S, exec, screenshot"
        "$mainMod SHIFT, S, exec, screenshot select"

        # Focus movement with vim keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Swap windows
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        # Resize Windows
        "$mainMod ALT, l, resizeactive, 30 0"
        "$mainMod ALT, h, resizeactive, -30 0"
        "$mainMod ALT, k, resizeactive, 0 -30"
        "$mainMod ALT, j, resizeactive, 0 30"

        # Workspace switching
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
        "$mainMod, TAB, workspace, previous" # jump to last used workspace

        # Move windows to workspaces
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
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      workspace = [
      	"1,monitor:DP-5"
      	"2,monitor:HDMI-A-3"
      	"3,monitor:DP-5"
      	"4,monitor:HDMI-A-3"
      	"5,monitor:DP-5"
      	"6,monitor:HDMI-A-3"
      	"7,monitor:DP-5"
      	"8,monitor:HDMI-A-3"
      	"9,monitor:DP-5"
      	"10,monitor:HDMI-A-3"
      ];
    };
  };

  home.packages = with pkgs; [ hyprpicker ];
}
