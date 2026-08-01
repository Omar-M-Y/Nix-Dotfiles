{ ... }: {
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "HDMI-A-1,1920x1080@75, auto, 1"
      "DP-1, 1920x1080@240, auto, 1"
      # "Virtual-1, 1920x1080@60, auto, 1"
      # ", 1920x1080@60, auto, 1"
    ];
  };
}
