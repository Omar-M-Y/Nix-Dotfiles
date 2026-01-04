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
    ];
    layerrule = [
        "animation slide, match:namespace rofi"
    ];

  };
}
