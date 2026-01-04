# rofi/default.nix
{ pkgs, config, ... }:

let
  # 1. Define the absolute path where Matugen writes the file
  # This results in a string like "/home/yahya/.config/rofi/colors.rasi"
  colorsPath = "${config.home.homeDirectory}/.config/rofi/colors.rasi";
in
{
  programs.rofi = {
    enable = true;
    
    # Rofi will look for "style-1.rasi" in ~/.config/rofi/
    theme = "style-1"; 
    
    font = "JetBrainsMono Nerd Font 10";
    
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "Apps:";
      dpi = 0;
    };
  };

  # 2. Generate the file, injecting the absolute path variable
  xdg.configFile."rofi/style-1.rasi".text = import ./style-1.nix {
    inherit colorsPath; 
  };
}
