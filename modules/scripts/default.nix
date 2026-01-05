{ config, pkgs, ... }:

let
  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    # 1. Force ImageMagick into the path
    export PATH=${pkgs.imagemagick}/bin:$PATH

    if [ -z "$1" ]; then
      echo "Usage: set-wallpaper <path/to/image>"
      exit 1
    fi

    # 2. Create a temporary alias if 'convert' is missing
    # Pywal hardcodes 'convert', but NixOS provides 'magick'
    if ! command -v convert &> /dev/null; then
      ln -s ${pkgs.imagemagick}/bin/magick /tmp/convert
      export PATH=/tmp:$PATH
    fi
    # Pywalfox update:
    pywalfox update
    echo "Setting wallpaper..."
    
    # 3. Cache and Set Wallpaper
    cp -f "$1" "${config.home.homeDirectory}/.current_wallpaper"
    ${pkgs.swww}/bin/swww img "$1" --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 --transition-fps 60
    
    # 4. Generate Colors (Verbose mode to see errors)
    echo "Generating colors..."
    ${pkgs.pywal}/bin/wal -i "$1" -n
    
    # 5. Reload Apps

    ${pkgs.hyprland}/bin/hyprctl reload
  '';
in
{
  home.packages = [
    setWallpaper
    pkgs.pywal
    pkgs.imagemagick  # Required for color generation
  ];
}
