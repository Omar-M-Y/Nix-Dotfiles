{ ... }: {
  wayland.windowManager.hyprland.settings = {
    # --- Variables ---
    "$mainMod" = "SUPER";
    "$terminal" = "kitty";
    "$filemanager" = "kitty -e yazi";
    "$browser" = "firefox";
    "$editor" = "code";
    
    # Screenshots
    "$shot-screen" = "hyprshot -m output";
    "$shot-region" = "hyprshot -m region";

    # --- Standard Binds (bind) ---
    bind = [
      "CTRL SHIFT, 3, exec, $shot-screen"
      "CTRL SHIFT, 4, exec, $shot-region"
      "CTRL SHIFT, 5, exec, ~/.config/hypr/scripts/rec_gui.sh"
      "$mainMod SHIFT, V, exec, ~/.config/rofi/clip-man/clipboard-menu.sh"
      # "$mainMod, SPACE, exec, ~/.config/rofi/launchers/launcher-3.sh"
      "$mainMod, SPACE, exec, rofi -show drun"
      "$mainMod, W, exec, ~/.config/hypr/scripts/rofi_wallpaper_toggle.sh"
      "$mainMod, M, exec, ~/.config/rofi/power-menu/rofi-powermenu.sh"
      "$mainMod, T, exec, swaync-client -t"
    ];

    # --- Binds with Descriptions (bindd) ---
    bindd = [
      # Apps & System
      "$mainMod, RETURN, Opens your preferred terminal emulator, exec, $terminal"
      "$mainMod, E, Opens your preferred filemanager, exec, $filemanager"
      "$mainMod, Q, Closes current window, killactive,"
      "$mainMod, V, Switches window between floating and tiling, togglefloating,"
      "$mainMod, B, Opens Browser, exec, $browser"
      "$mainMod, C, Open Code Editor, exec, $editor"
      "$mainMod, L, Lock the screen, exec, hyprlock"
      "$mainMod, O, Reload/restarts Waybar, exec, killall -SIGUSR2 waybar"
      
      # Window Management
      "$mainMod, F, Toggles fullscreen, fullscreen"
      "$mainMod, Y, Pin current window, pin"
      "$mainMod, J, Toggles split mode, togglesplit,"
      
      # Groups
      "$mainMod, K, Toggles group mode, togglegroup,"
      "$mainMod, Tab, Switches to next window in group, changegroupactive, f"

      # Gaps (Quotes escaped with backslash)
      "$mainMod SHIFT, G, Set CachyOS default gaps, exec, hyprctl --batch \"keyword general:gaps_out 5;keyword general:gaps_in 3\""
      "$mainMod, G, Remove gaps, exec, hyprctl --batch \"keyword general:gaps_out 0;keyword general:gaps_in 0\""

      # Playback Control
      ", XF86AudioPlay, Toggles play/pause, exec, playerctl play-pause"
      ", XF86AudioNext, Next track, exec, playerctl next"
      ", XF86AudioPrev, Previous track, exec, playerctl previous"

      # Move Focus
      "$mainMod, left, Move focus to the left, movefocus, l"
      "$mainMod, right, Move focus to the right, movefocus, r"
      "$mainMod, up, Move focus upwards, movefocus, u"
      "$mainMod, down, Move focus downwards, movefocus, d"

      # Move Window
      "$mainMod SHIFT, left, Move active window to the left, movewindow, l"
      "$mainMod SHIFT, right, Move active window to the right, movewindow, r"
      "$mainMod SHIFT, up, Move active window upwards, movewindow, u"
      "$mainMod SHIFT, down, Move active window downwards, movewindow, d"
      "$mainMod, mouse:272, Move the window towards a direction, movewindow"

      # Resize Submap Trigger
      "$mainMod, R, Activates window resizing mode, submap, resizer"

      # Quick Resize (Keyboard)
      "$mainMod CTRL SHIFT, right, Resize to the right, resizeactive, 15 0"
      "$mainMod CTRL SHIFT, left, Resize to the left, resizeactive, -15 0"
      "$mainMod CTRL SHIFT, up, Resize upwards, resizeactive, 0 -15"
      "$mainMod CTRL SHIFT, down, Resize downwards, resizeactive, 0 15"
      "$mainMod CTRL SHIFT, l, Resize to the right, resizeactive, 15 0"
      "$mainMod CTRL SHIFT, h, Resize to the left, resizeactive, -15 0"
      "$mainMod CTRL SHIFT, k, Resize upwards, resizeactive, 0 -15"
      "$mainMod CTRL SHIFT, j, Resize downwards, resizeactive, 0 15"

      # Workspaces (Switching)
      "$mainMod, 1, Switch to workspace 1, workspace, 1"
      "$mainMod, 2, Switch to workspace 2, workspace, 2"
      "$mainMod, 3, Switch to workspace 3, workspace, 3"
      "$mainMod, 4, Switch to workspace 4, workspace, 4"
      "$mainMod, 5, Switch to workspace 5, workspace, 5"
      "$mainMod, 6, Switch to workspace 6, workspace, 6"
      "$mainMod, 7, Switch to workspace 7, workspace, 7"
      "$mainMod, 8, Switch to workspace 8, workspace, 8"
      "$mainMod, 9, Switch to workspace 9, workspace, 9"
      "$mainMod, 0, Switch to workspace 10, workspace, 10"
      "$mainMod, PERIOD, Scroll workspaces inc, workspace, e+1"
      "$mainMod, COMMA, Scroll workspaces dec, workspace, e-1"
      "$mainMod, slash, Switch to previous workspace, workspace, previous"
      "$mainMod, mouse_down, Scroll workspaces inc, workspace, e+1"
      "$mainMod, mouse_up, Scroll workspaces dec, workspace, e-1"

      # Special Workspaces
      "$mainMod, minus, Move active window to Special, movetoworkspace, special"
      "$mainMod, equal, Toggles the Special workspace, togglespecialworkspace, special"
      "$mainMod, F1, Call special scratchpad, togglespecialworkspace, scratchpad"
      "$mainMod ALT SHIFT, F1, Move to scratchpad, movetoworkspacesilent, special:scratchpad"

      # Move Window to Workspace (Switch)
      "$mainMod CTRL, 1, Move window and switch to 1, movetoworkspace, 1"
      "$mainMod CTRL, 2, Move window and switch to 2, movetoworkspace, 2"
      "$mainMod CTRL, 3, Move window and switch to 3, movetoworkspace, 3"
      "$mainMod CTRL, 4, Move window and switch to 4, movetoworkspace, 4"
      "$mainMod CTRL, 5, Move window and switch to 5, movetoworkspace, 5"
      "$mainMod CTRL, 6, Move window and switch to 6, movetoworkspace, 6"
      "$mainMod CTRL, 7, Move window and switch to 7, movetoworkspace, 7"
      "$mainMod CTRL, 8, Move window and switch to 8, movetoworkspace, 8"
      "$mainMod CTRL, 9, Move window and switch to 9, movetoworkspace, 9"
      "$mainMod CTRL, 0, Move window and switch to 10, movetoworkspace, 10"
      "$mainMod CTRL, left, Move window to next, movetoworkspace, -1"
      "$mainMod CTRL, right, Move window to prev, movetoworkspace, +1"

      # Move Window to Workspace (Silent)
      "$mainMod SHIFT, 1, Move silent to 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, Move silent to 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, Move silent to 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, Move silent to 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, Move silent to 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, Move silent to 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, Move silent to 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, Move silent to 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, Move silent to 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, Move silent to 10, movetoworkspacesilent, 10"
    ];

    # --- Repeating Binds (bindel) ---
    bindel = [
      ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{if($1>100) system(\"pactl set-sink-volume @DEFAULT_SINK@ 100%\")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
      ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
      ", XF86AudioMute, exec, amixer sset Master toggle | sed -En '/\\[on\\]/ s/.*\\[([0-9]+)%\\].*/\\1/ p; /\\[off\\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob"
      ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
    ];

    # --- Mouse Binds (bindm) ---
    bindm = [
      "$mainMod SHIFT, mouse:272, resizewindow"
      "$mainMod, mouse:272, movewindow"
    ];



    # --- Additional Settings ---
    binds = {
      allow_workspace_cycles = 1;
      workspace_back_and_forth = 1;
      workspace_center_on = 1;
      movefocus_cycles_fullscreen = true;
      window_direction_monitor_fallback = true;
    };
  };
}
