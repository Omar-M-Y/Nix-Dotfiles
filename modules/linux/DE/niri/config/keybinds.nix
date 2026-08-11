{ ... }:
let
  ipc = "noctalia msg";
in
{
  programs.niri.settings.binds = {

    # ── Noctalia IPC ──────────────────────────────────────────────────────────
    "Mod+Space".action.spawn-sh   = "${ipc} panel-toggle launcher";
    "Mod+Shift+V".action.spawn-sh = "${ipc} panel-toggle clipboard";
    "Mod+W".action.spawn-sh       = "${ipc} panel-toggle wallpaper";
    "Mod+M".action.spawn-sh       = "${ipc} panel-toggle session";
    "Mod+T".action.spawn-sh       = "${ipc} panel-toggle control-center";
    "Mod+G".action.spawn-sh       = "${ipc} volume togglePanel";

    # ── Apps ──────────────────────────────────────────────────────────────────
    "Mod+Return".action.spawn = [ "kitty" ];
    "Mod+E".action.spawn      = [ "kitty" "-e" "yazi" ];
    "Mod+B".action.spawn      = [ "firefox" ];
    # "Mod+C".action.spawn      = [ "code" ];
    "Mod+L".action.spawn-sh   = "${ipc} session lock";

    # ── Screenshots ───────────────────────────────────────────────────────────
    "Print".action.screenshot               = {};
    "Ctrl+Print".action.screenshot-screen   = {};
    "Alt+Print".action.screenshot-window    = {};
    "Ctrl+Shift+3".action.screenshot        = {};
    "Ctrl+Shift+4".action.screenshot-screen = {};

    # ── Window Management ─────────────────────────────────────────────────────
    "Mod+Q".action.close-window           = {};
    "Mod+F".action.fullscreen-window      = {};
    "Mod+Shift+F".action.maximize-column  = {};
    "Mod+V".action.toggle-window-floating = {};
    # "Mod+Shift+V2".action.switch-focus-between-floating-and-tiling = {};

    # ── Focus Movement ────────────────────────────────────────────────────────
    "Mod+Left".action.focus-column-left   = {};
    "Mod+Right".action.focus-column-right = {};
    "Mod+Up".action.focus-window-up       = {};
    "Mod+Down".action.focus-window-down   = {};

    # ── Window Movement ───────────────────────────────────────────────────────
    "Mod+Shift+Left".action.move-column-left   = {};
    "Mod+Shift+Right".action.move-column-right = {};
    "Mod+Shift+Up".action.move-window-up       = {};
    "Mod+Shift+Down".action.move-window-down   = {};

    # ── Monitor Focus ─────────────────────────────────────────────────────────
    "Mod+Shift+H".action.focus-monitor-left  = {};
    "Mod+Shift+L".action.focus-monitor-right = {};
    "Mod+Shift+J".action.focus-monitor-down  = {};
    "Mod+Shift+K".action.focus-monitor-up    = {};

    # ── Move Column to Monitor ────────────────────────────────────────────────
    # "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left  = {};
    # "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};
    # "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down  = {};
    # "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up    = {};

    # ── Resize ────────────────────────────────────────────────────────────────
    "Mod+Ctrl+Shift+Right".action.set-column-width = "+15";
    "Mod+Ctrl+Shift+Left".action.set-column-width  = "-15";
    "Mod+Ctrl+Shift+Down".action.set-window-height = "+15";
    "Mod+Ctrl+Shift+Up".action.set-window-height   = "-15";
    "Mod+Ctrl+Shift+L".action.set-column-width     = "+15";
    "Mod+Ctrl+Shift+H".action.set-column-width     = "-15";
    "Mod+Ctrl+Shift+J".action.set-window-height    = "+15";
    "Mod+Ctrl+Shift+K".action.set-window-height    = "-15";
    "Mod+Minus".action.set-column-width            = "-10%";
    "Mod+Equal".action.set-column-width            = "+10%";
    "Mod+Shift+Minus".action.set-window-height     = "-10%";
    "Mod+Shift+Equal".action.set-window-height     = "+10%";

    # ── Column Layout ─────────────────────────────────────────────────────────
    "Mod+R".action.switch-preset-column-width      = {};
    "Mod+Shift+R".action.switch-preset-column-width-back = {};
    "Mod+Ctrl+R".action.reset-window-height        = {};
    "Mod+Ctrl+Shift+R".action.switch-preset-window-height = {};
    "Mod+Ctrl+F".action.expand-column-to-available-width = {};
    "Mod+C".action.center-column                   = {};
    "Mod+Ctrl+C".action.center-visible-columns     = {};
    "Mod+K".action.toggle-column-tabbed-display    = {};
    "Mod+BracketLeft".action.consume-or-expel-window-left   = {};
    "Mod+BracketRight".action.consume-or-expel-window-right = {};
    "Mod+Comma".action.consume-window-into-column  = {};
    "Mod+Period".action.expel-window-from-column   = {};

    # ── Overview ──────────────────────────────────────────────────────────────
    "Mod+O" = { repeat = false; action.toggle-overview = {}; };

    # ── Workspace Switching ───────────────────────────────────────────────────
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;

    "Mod+U".action.focus-workspace-down         = {};
    "Mod+I".action.focus-workspace-up           = {};
    "Mod+Page_Down".action.focus-workspace-down  = {};
    "Mod+Page_Up".action.focus-workspace-up      = {};
    "Mod+Slash".action.focus-workspace-previous  = {};

    # ── Move Column to Workspace ──────────────────────────────────────────────
    "Mod+Ctrl+1".action.move-column-to-workspace = 1;
    "Mod+Ctrl+2".action.move-column-to-workspace = 2;
    "Mod+Ctrl+3".action.move-column-to-workspace = 3;
    "Mod+Ctrl+4".action.move-column-to-workspace = 4;
    "Mod+Ctrl+5".action.move-column-to-workspace = 5;
    "Mod+Ctrl+6".action.move-column-to-workspace = 6;
    "Mod+Ctrl+7".action.move-column-to-workspace = 7;
    "Mod+Ctrl+8".action.move-column-to-workspace = 8;
    "Mod+Ctrl+9".action.move-column-to-workspace = 9;
    "Mod+Ctrl+U".action.move-column-to-workspace-down = {};
    "Mod+Ctrl+I".action.move-column-to-workspace-up   = {};
    "Mod+Ctrl+Left".action.move-column-to-workspace-up   = {};
    "Mod+Ctrl+Right".action.move-column-to-workspace-down = {};

    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Shift+6".action.move-column-to-workspace = 6;
    "Mod+Shift+7".action.move-column-to-workspace = 7;
    "Mod+Shift+8".action.move-column-to-workspace = 8;
    "Mod+Shift+9".action.move-column-to-workspace = 9;

    # ── Workspace Reorder ─────────────────────────────────────────────────────
    "Mod+Shift+U".action.move-workspace-down = {};
    "Mod+Shift+I".action.move-workspace-up   = {};

    # ── Wheel Scrolling ───────────────────────────────────────────────────────
    "Mod+WheelScrollDown"      = { cooldown-ms = 150; action.focus-workspace-down = {}; };
    "Mod+WheelScrollUp"        = { cooldown-ms = 150; action.focus-workspace-up   = {}; };
    "Mod+Ctrl+WheelScrollDown" = { cooldown-ms = 150; action.move-column-to-workspace-down = {}; };
    "Mod+Ctrl+WheelScrollUp"   = { cooldown-ms = 150; action.move-column-to-workspace-up   = {}; };
    "Mod+WheelScrollRight".action.focus-column-right      = {};
    "Mod+WheelScrollLeft".action.focus-column-left        = {};
    "Mod+Ctrl+WheelScrollRight".action.move-column-right  = {};
    "Mod+Ctrl+WheelScrollLeft".action.move-column-left    = {};

    # ── Media Keys ────────────────────────────────────────────────────────────
    "XF86AudioPlay" = { allow-when-locked = true; action.spawn = [ "playerctl" "play-pause" ]; };
    "XF86AudioNext" = { allow-when-locked = true; action.spawn = [ "playerctl" "next" ]; };
    "XF86AudioPrev" = { allow-when-locked = true; action.spawn = [ "playerctl" "previous" ]; };
    "XF86AudioRaiseVolume" = { allow-when-locked = true; action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"; };
    "XF86AudioLowerVolume" = { allow-when-locked = true; action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"; };
    "XF86AudioMute"        = { allow-when-locked = true; action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; };
    "XF86MonBrightnessUp"   = { allow-when-locked = true; action.spawn = [ "brightnessctl" "s" "+5%" ]; };
    "XF86MonBrightnessDown" = { allow-when-locked = true; action.spawn = [ "brightnessctl" "s" "5%-" ]; };

    # ── Session ───────────────────────────────────────────────────────────────
    "Mod+Shift+E".action.quit               = {};
    "Mod+Shift+P".action.power-off-monitors = {};
    "Mod+Escape" = { allow-inhibiting = false; action.toggle-keyboard-shortcuts-inhibit = {}; };
    "Mod+Shift+Slash".action.show-hotkey-overlay = {};

  };
}
