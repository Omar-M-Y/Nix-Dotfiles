{ pkgs, ... }:

let
  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    if [ -z "$1" ]; then
      echo "Usage: set-wallpaper <path/to/image>"
      exit 1
    fi

    swww img "$1" --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 --transition-fps 60
    matugen image "$1"
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
