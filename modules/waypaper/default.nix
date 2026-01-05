{ pkgs, config, lib, ... }: 
let
  waypaperSettings = import ./config.nix { inherit config; };
  iniFormat = pkgs.formats.ini { };
  
  toggleWaypaper = pkgs.writeShellScriptBin "toggle-waypaper" ''
    if hyprctl clients | grep -q "class: waypaper"; then
      pkill waypaper
    else
      ${pkgs.waypaper}/bin/waypaper
    fi
  '';
in {
  imports = [ ./rules.nix ];

  home.packages = [ pkgs.waypaper toggleWaypaper ];

  # 1. Config File (INI)
  xdg.configFile."waypaper/config.ini".source = iniFormat.generate "waypaper-config" waypaperSettings;

  # 2. CSS File (Symlink your new style.css)
  xdg.configFile."waypaper/style.css".source = ./style.css;
}
