{ ... }: {
  wayland.windowManager.hyprland.settings = {

    # --- Rendering ---
    render = {
      direct_scanout = true;
      ctm_animation = 0; 
    };

    # --- Dwindle Layout ---
    dwindle = {
      special_scale_factor = 0.8;
      pseudotile = true;
      preserve_split = true;
      smart_resizing = true;
      default_split_ratio = 1;
    };

    # --- Master Layout ---
    master = {
      new_status = "master";
      special_scale_factor = 0.8;
    };
  };
}