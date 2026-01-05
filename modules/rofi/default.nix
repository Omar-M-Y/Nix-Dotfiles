{ pkgs, config, ... }:

let
  # The location where Pywal will generate the colors
  colorsPath = "${config.home.homeDirectory}/.cache/wal/colors-rofi-dark.rasi";

  # The Template Content (What Pywal uses to build the file)
  # We define it here so it's managed by Nix
  pywalTemplate = ''
    * {
        background: {background};
        foreground: {foreground};
        accent:     {color4};

        background-color:            @background;
        border-color:                @accent;
        
        normal-background:           transparent;
        normal-foreground:           @foreground;
        alternate-normal-background: transparent;
        alternate-normal-foreground: @foreground;

        selected-normal-background:  @accent;
        selected-normal-foreground:  {background};
    }
  '';
in
{
  programs.rofi = {
    enable = true;
    theme = "style-1";
    font = "JetBrainsMono Nerd Font 10";
    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "Apps:";
    };
  };

  # Declaratively create the Pywal template file
  xdg.configFile."wal/templates/colors-rofi-dark.rasi".text = pywalTemplate;

  # Create the Rofi style file
  xdg.configFile."rofi/style-1.rasi".text = import ./style-1.nix {
    inherit colorsPath; 
  };
}
