{ config, ... }: {
  Settings = {
    language = "en";
    folder = "${config.home.homeDirectory}/Pictures/Wallpapers";
    backend = "swww";
    monitors = "All";
    fill = "fill";
    sort = "name";
    color = "#ffffff";
    subfolders = false;
    zen_mode = true;
    show_hidden = false;
    show_gifs_only = false;
    use_xdg_state = false;
    post_command = "set-wallpaper $wallpaper";
    
    # SWWW Transition settings
    swww_transition_type = "grow";
    swww_transition_step = 90;
    swww_transition_angle = 0;
    swww_transition_duration = 2;
    swww_transition_fps = 60;
  };
}
