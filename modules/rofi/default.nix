# rofi/default.nix
{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    # package = pkgs.rofi-wayland;
    
    # 1. Set the theme name to "style-1"
    # Rofi will look for style-1.rasi in ~/.config/rofi/
    theme = "style-1";

    font = "JetBrainsMono Nerd Font 10";
    
    # Basic config options go here
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "Apps:";
      dpi = 0;
    };
  };

  # 2. Generate the style-1.rasi file using the content from style-1.nix
  xdg.configFile."rofi/style-1.rasi".text = import ./style-1.nix { };
}
