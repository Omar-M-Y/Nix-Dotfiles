{ config, pkgs, ... }:

let
  walTemplatesDir = "${config.home.homeDirectory}/.config/wal/templates";
in
{
  home.packages = with pkgs; [ pywal pywalfox-native ];

  # --- Pywal Templates ---

  # 1. Hyprland Template (Required for colors-hyprland.conf)
  xdg.configFile."wal/templates/colors-hyprland.conf".text = ''
    $foreground = rgb({foreground.strip})
    $background = rgb({background.strip})
    $wallpaper = {wallpaper}

    $cursor = rgb({cursor.strip})

    $color0 = rgb({color0.strip})
    $color1 = rgb({color1.strip})
    $color2 = rgb({color2.strip})
    $color3 = rgb({color3.strip})
    $color4 = rgb({color4.strip})
    $color5 = rgb({color5.strip})
    $color6 = rgb({color6.strip})
    $color7 = rgb({color7.strip})
    $color8 = rgb({color8.strip})
    $color9 = rgb({color9.strip})
    $color10 = rgb({color10.strip})
    $color11 = rgb({color11.strip})
    $color12 = rgb({color12.strip})
    $color13 = rgb({color13.strip})
    $color14 = rgb({color14.strip})
    $color15 = rgb({color15.strip})
  '';

  # 2. Quickshell Template (Keep this if you use Quickshell)
  xdg.configFile."wal/templates/quickshell-colors.qml".text = ''
    pragma Singleton
    import QtQuick

    QtObject {
        property color background: "{background}"
        property color foreground: "{foreground}"
        property color cursor: "{cursor}"
        property color color0: "{color0}"
        property color color1: "{color1}"
        property color color2: "{color2}"
        property color color3: "{color3}"
        property color color4: "{color4}"
        property color color5: "{color5}"
        property color color6: "{color6}"
        property color color7: "{color7}"
        property color color8: "{color8}"
        property color color9: "{color9}"
        property color color10: "{color10}"
        property color color11: "{color11}"
        property color color12: "{color12}"
        property color color13: "{color13}"
        property color color14: "{color14}"
        property color color15: "{color15}"
    }
  '';
}
