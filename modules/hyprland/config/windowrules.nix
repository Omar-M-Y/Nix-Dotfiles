{ ... }: {
  wayland.windowManager.hyprland.settings = {
    
    # Must be a list [ ... ]
    # The rule itself must be inside quotes " ... "
    # windowrule = [
    #   "opacity 0.92, class:^(discord|firefox)$"
    # ];
    windowrule = [
        "opacity 0.92 match:class discord|firefox"
        "match:fullscreen class:^steam_app_\d+$"
        # "opacity 0.85 0.85, match:class:^(.*)(menu|popup)(.*)$"
        # "blur on,class:^(.*)(menu|popup)(.*)$"
    ];
    layerrule = [
        "animation slide, match:namespace rofi"
        "ignore_alpha 0.5, match:namespace rofi"
        "blur on, match:namespace rofi"
        "ignore_alpha 0.5, match:namespace waybar"
        "blur on, match:namespace waybar"
        "blur_popups on, match:namespace waybar"
        "animation slide right, match:namespace swaync-control-center"
        "animation slide, match:namespace waypaper"
    ];

  };
}
