{ config, pkgs, inputs, ... }:

let 
  matugenConfigDir = "${config.home.homeDirectory}/.config/matugen";
  hyprlandConfigDir = "${config.home.homeDirectory}/.config/hypr";
  kittyConfigDir = "${config.home.homeDirectory}/.config/kitty";
  fishConfigDir = "${config.home.homeDirectory}/.config/fish/conf.d";
  # 1. Define Quickshell path
  quickshellConfigDir = "${config.home.homeDirectory}/.config/quickshell";
  rofiConfigDir = "${config.home.homeDirectory}/.config/rofi";
in
{
  home.packages = [ inputs.matugen.packages.${pkgs.system}.default ];

  # 2. Config.toml (Added Quickshell template)
  xdg.configFile."matugen/config.toml".text = ''
    [config]
    reload_apps = true
    scheme = "fidelity" 

    post_hook = [
      "hyprctl reload",
      "pkill -SIGUSR2 waybar",
      "${pkgs.procps}/bin/pkill -SIGUSR1 kitty"
      # Optional: Restart Quickshell to apply colors immediately
      # "pkill quickshell; quickshell & disown" 
    ]

    # --- Templates ---

    [templates.hyprland-colors]
    input_path = "${matugenConfigDir}/templates/hyprland-colors.conf"
    output_path = "${hyprlandConfigDir}/colors.conf"

    [templates.kitty-colors]
    input_path = "${matugenConfigDir}/templates/kitty-colors.conf"
    output_path = "${kittyConfigDir}/colors.conf"

    [templates.fish-colors]
    input_path = "${matugenConfigDir}/templates/fish-colors.fish"
    output_path = "${fishConfigDir}/matugen.fish"

    [templates.quickshell]
    input_path = "${matugenConfigDir}/templates/quickshell-colors.qml"
    output_path = "${quickshellConfigDir}/Colors.qml"

    [templates.rofi]
    input_path = "${matugenConfigDir}/templates/rofi-colors.rasi"
    output_path = "${rofiConfigDir}/colors.rasi"

  '';

  # 3. Hyprland Template
  xdg.configFile."matugen/templates/hyprland-colors.conf".text = ''
    $primary = rgb({{colors.primary.default.hex_stripped}})
    $secondary = rgb({{colors.secondary.default.hex_stripped}})
    $outline = rgb({{colors.outline.default.hex_stripped}})
    $alert = rgb({{colors.error.default.hex_stripped}})
    $surface = rgb({{colors.surface.default.hex_stripped}})
    $surface_variant = rgb({{colors.surface_variant.default.hex_stripped}})
    $on_surface = rgb({{colors.on_surface.default.hex_stripped}})
    $background = rgb({{colors.background.default.hex_stripped}})
    $primary_container = rgb({{colors.primary_container.default.hex_stripped}})
    $secondary_container = rgb({{colors.secondary_container.default.hex_stripped}})
  '';

  # 4. Kitty Template
  xdg.configFile."matugen/templates/kitty-colors.conf".text = ''
    foreground              #{{colors.on_surface.default.hex_stripped}}
    background              #{{colors.surface.default.hex_stripped}}
    selection_foreground    #{{colors.on_secondary.default.hex_stripped}}
    selection_background    #{{colors.secondary.default.hex_stripped}}
    cursor                  #{{colors.primary.default.hex_stripped}}
    cursor_text_color       #{{colors.on_primary.default.hex_stripped}}
    url_color               #{{colors.primary.default.hex_stripped}}
    active_border_color     #{{colors.primary.default.hex_stripped}}
    inactive_border_color   #{{colors.outline.default.hex_stripped}}
    color0  #{{colors.surface.default.hex_stripped}}
    color8  #{{colors.surface_variant.default.hex_stripped}}
    color1  #{{colors.error.default.hex_stripped}}
    color9  #{{colors.error_container.default.hex_stripped}}
    color2  #{{colors.primary.default.hex_stripped}}
    color10 #{{colors.primary_container.default.hex_stripped}}
    color3  #{{colors.tertiary.default.hex_stripped}}
    color11 #{{colors.tertiary_container.default.hex_stripped}}
    color4  #{{colors.secondary.default.hex_stripped}}
    color12 #{{colors.secondary_container.default.hex_stripped}}
    color5  #{{colors.tertiary.default.hex_stripped}}
    color13 #{{colors.tertiary_container.default.hex_stripped}}
    color6  #{{colors.inverse_primary.default.hex_stripped}}
    color14 #{{colors.inverse_on_surface.default.hex_stripped}}
    color7  #{{colors.on_surface.default.hex_stripped}}
    color15 #{{colors.inverse_surface.default.hex_stripped}}
  '';

  # 5. Fish Template
  xdg.configFile."matugen/templates/fish-colors.fish".text = ''
    set -g fish_color_normal {{colors.on_surface.default.hex_stripped}}
    set -g fish_color_command {{colors.primary.default.hex_stripped}}
    set -g fish_color_param {{colors.secondary.default.hex_stripped}}
    set -g fish_color_keyword {{colors.tertiary.default.hex_stripped}}
    set -g fish_color_quote {{colors.surface_variant.default.hex_stripped}}
    set -g fish_color_redirection {{colors.on_surface_variant.default.hex_stripped}}
    set -g fish_color_end {{colors.on_surface.default.hex_stripped}}
    set -g fish_color_error {{colors.error.default.hex_stripped}}
    set -g fish_color_gray {{colors.outline.default.hex_stripped}}
    set -g fish_color_selection --background={{colors.secondary_container.default.hex_stripped}}
    set -g fish_color_search_match --background={{colors.secondary_container.default.hex_stripped}}
    set -g fish_color_operator {{colors.primary.default.hex_stripped}}
    set -g fish_color_escape {{colors.tertiary.default.hex_stripped}}
    set -g fish_color_autosuggestion {{colors.outline.default.hex_stripped}}
    set -g fish_color_cancel {{colors.error.default.hex_stripped}}
  '';

  # 6. Quickshell Template (NEW)
  xdg.configFile."matugen/templates/quickshell-colors.qml".text = ''
    pragma Singleton
    import QtQuick

    QtObject {
        property color primary: "{{colors.primary.default.hex}}"
        property color onPrimaryColor: "{{colors.on_primary.default.hex}}"
        
        property color secondary: "{{colors.secondary.default.hex}}"
        property color onSecondaryColor: "{{colors.on_secondary.default.hex}}"
        
        property color background: "{{colors.background.default.hex}}"
        property color onBackgroundColor: "{{colors.on_background.default.hex}}"
        
        property color surface: "{{colors.surface.default.hex}}"
        property color onSurfaceColor: "{{colors.on_surface.default.hex}}"
        
        property color error: "{{colors.error.default.hex}}"
        
        property color outline: "{{colors.outline.default.hex}}"
    }
  '';

  # 7. Rofi Template (Updated for Transparency)
  xdg.configFile."matugen/templates/rofi-colors.rasi".text = ''
    * {
        /* Use 80% opacity (CC in hex) for the main window */
        background: {{colors.background.default.hex}}CC;
        
        foreground: {{colors.on_surface.default.hex}};
        border-color: {{colors.outline.default.hex}};
        
        normal-background: transparent;
        normal-foreground: {{colors.on_surface.default.hex}};
        
        selected-normal-background: {{colors.primary.default.hex}};
        selected-normal-foreground: {{colors.on_primary.default.hex}};
        
        alternate-normal-background: transparent;
        alternate-normal-foreground: {{colors.on_surface.default.hex}};
    }
  '';
}
