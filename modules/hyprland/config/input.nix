{ ... }: {
    wayland.windowManager.hyprland.settings = {
        input = {
            kb_layout = "us,gb";
            kb_options = "grp:alt_space_toggle";
            float_switch_override_focus = 2;
            follow_mouse = 1;
        }; 
    };
}