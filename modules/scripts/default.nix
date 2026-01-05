{ config, pkgs, ... }:

let
  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    if [ -z "$1" ]; then
      echo "Usage: set-wallpaper <path/to/image>"
      exit 1
    fi

    # 1. Cache the wallpaper for Hyprlock
    # This copies the image to ~/.current_wallpaper so hyprlock can always find it
    cp -f "$1" "${config.home.homeDirectory}/.current_wallpaper"

    # 2. Set the wallpaper with swww
    swww img "$1" --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 --transition-fps 60
    
    # 3. Generate colors with Matugen
    matugen image "$1"
    
    # 4. Reload apps to pick up new colors
    ${pkgs.procps}/bin/pkill -SIGUSR1 kitty
    ${pkgs.procps}/bin/pkill -SIGUSR2 waybar
    ${pkgs.hyprland}/bin/hyprctl reload
  '';
in
{
  home.packages = [
    setWallpaper
  ];
}
