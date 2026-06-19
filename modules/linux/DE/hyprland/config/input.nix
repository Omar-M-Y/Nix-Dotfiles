{ ... }: {
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us,gb";
      kb_options = "grp:alt_space_toggle";
      float_switch_override_focus = 2;
      follow_mouse = 1;

      # touchpad = {
      #     natural_scroll = true;
      #     tap-to-click = true;
      #   };

      accel_profile = "flat";
      force_no_accel = true;
    };
    # gesture = [
    #   "3, horizontal, workspace"
    #   "3, up, fullscreen"
    # ];
  };
}
