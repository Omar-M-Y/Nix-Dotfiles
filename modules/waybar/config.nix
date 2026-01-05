{
  mainBar = {
    layer = "bottom";
    reload_style_on_change = true;
    position = "top";
    height = 30;
    margin-left = 0;
    margin-bottom = 0;
    margin-right = 0;
    spacing = 5;


    modules-left = ["hyprland/workspaces" "hyprland/window"];
    # modules-center = ;
    modules-right= ["tray" "clock" ] ;
    };
}  // builtins.import ./modules 

