{ pkgs, ... }:

{
  # 1. Install the SwayNC package
  home.packages = with pkgs; [ 
    swaynotificationcenter 
  ];

  # 2. Link your config file directly
  # This places ./config.json at ~/.config/swaync/config.json
  xdg.configFile."swaync/config.json".source = ./config.json;

  # 3. Link your style sheet directly
  # This places ./style.css at ~/.config/swaync/style.css
  xdg.configFile."swaync/style.css".source = ./style.css;
}
