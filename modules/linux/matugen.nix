# modules/linux/matugen.nix
{ config, pkgs, inputs, ... }:

let
  matugenConfigDir = "${config.home.homeDirectory}/.config/matugen";
  hyprlandConfigDir = "${config.home.homeDirectory}/.config/hypr";
  kittyConfigDir = "${config.home.homeDirectory}/.config/kitty";
  fishConfigDir = "${config.home.homeDirectory}/.config/fish/conf.d";
  quickshellConfigDir = "${config.home.homeDirectory}/.config/quickshell";
  footConfigDir = "${config.home.homeDirectory}/.config/foot";
  # waybarConfigDir = "${config.home.homeDirectory}/.config/waybar"; # <-- Add this
  # rofiConfigDir = "${config.home.homeDirectory}/.config/rofi"; # <-- Add this
  yaziConfigDir = "${config.home.homeDirectory}/.config/yazi";
in
{
  home.packages = [ inputs.matugen.packages.${pkgs.system}.default ];

  xdg.configFile."matugen/config.toml".text = ''
    [config]
    reload_apps = true
    scheme = "fidelity"

    post_hook = [
      "hyprctl reload",
      "${pkgs.procps}/bin/pkill -SIGUSR1 kitty"
    ]

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

    [templates.foot-colors]
    input_path = "${matugenConfigDir}/templates/foot-colors.ini"
    output_path = "${footConfigDir}/colors.ini"


    [templates.yazi]
    input_path = "${matugenConfigDir}/templates/yazi-theme.toml"
    output_path = "${yaziConfigDir}/theme.toml"
  '';

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

xdg.configFile."matugen/templates/quickshell-colors.qml".text = ''
  pragma Singleton
  import QtQuick

  QtObject {
    property color primary: "{{colors.primary.default.hex}}"
    property color primaryForeground: "{{colors.on_primary.default.hex}}"
    property color secondary: "{{colors.secondary.default.hex}}"
    property color secondaryForeground: "{{colors.on_secondary.default.hex}}"
    property color background: "{{colors.background.default.hex}}"
    property color backgroundForeground: "{{colors.on_background.default.hex}}"
    property color surface: "{{colors.surface.default.hex}}"
    property color surfaceForeground: "{{colors.on_surface.default.hex}}"
    property color error: "{{colors.error.default.hex}}"
    property color outline: "{{colors.outline.default.hex}}"
  }
'';

xdg.configFile."matugen/templates/foot-colors.ini".text = ''
    [colors-dark] # <--- Change this from [colors]
    foreground={{colors.on_surface.default.hex_stripped}}
    background={{colors.surface.default.hex_stripped}}
    regular0={{colors.surface.default.hex_stripped}}
    regular1={{colors.error.default.hex_stripped}}
    regular2={{colors.primary.default.hex_stripped}}
    regular3={{colors.tertiary.default.hex_stripped}}
    regular4={{colors.secondary.default.hex_stripped}}
    regular5={{colors.tertiary.default.hex_stripped}}
    regular6={{colors.inverse_primary.default.hex_stripped}}
    regular7={{colors.on_surface.default.hex_stripped}}
    bright0={{colors.surface_variant.default.hex_stripped}}
    bright1={{colors.error_container.default.hex_stripped}}
    bright2={{colors.primary_container.default.hex_stripped}}
    bright3={{colors.tertiary_container.default.hex_stripped}}
    bright4={{colors.secondary_container.default.hex_stripped}}
    bright5={{colors.tertiary_container.default.hex_stripped}}
    bright6={{colors.inverse_on_surface.default.hex_stripped}}
    bright7={{colors.inverse_surface.default.hex_stripped}}
  '';


# xdg.configFile."matugen/templates/waybar-colors.css".text = ''
#     @define-color foreground {{colors.on_surface.default.hex}};
#     @define-color background {{colors.surface.default.hex}};
#     @define-color cursor {{colors.primary.default.hex}};
#
#     @define-color color0 {{colors.surface.default.hex}};
#     @define-color color1 {{colors.error.default.hex}};
#     @define-color color2 {{colors.primary.default.hex}};
#     @define-color color3 {{colors.tertiary.default.hex}};
#     @define-color color4 {{colors.secondary.default.hex}};
#     @define-color color5 {{colors.tertiary.default.hex}};
#     @define-color color6 {{colors.inverse_primary.default.hex}};
#     @define-color color7 {{colors.on_surface.default.hex}};
#     @define-color color8 {{colors.surface_variant.default.hex}};
#     @define-color color9 {{colors.error_container.default.hex}};
#     @define-color color10 {{colors.primary_container.default.hex}};
#     @define-color color11 {{colors.tertiary_container.default.hex}};
#     @define-color color12 {{colors.secondary_container.default.hex}};
#     @define-color color13 {{colors.tertiary_container.default.hex}};
#     @define-color color14 {{colors.inverse_on_surface.default.hex}};
#     @define-color color15 {{colors.inverse_surface.default.hex}};
#   '';
#
#
#   xdg.configFile."matugen/templates/rofi-colors.rasi".text = ''
#     * {
#         background: {{colors.surface.default.hex}};
#         foreground: {{colors.on_surface.default.hex}};
#         accent:     {{colors.primary.default.hex}};
#
#         background-color:            @background;
#         border-color:                @accent;
#
#         normal-background:           transparent;
#         normal-foreground:           @foreground;
#         alternate-normal-background: transparent;
#         alternate-normal-foreground: @foreground;
#
#         selected-normal-background:  @accent;
#         selected-normal-foreground:  {{colors.on_primary.default.hex}}; 
#     }
#   '';

xdg.configFile."matugen/templates/yazi-theme.toml".text = ''
  [manager]
  hovered         = { bg = "{{colors.secondary_container.default.hex}}", fg = "{{colors.on_secondary_container.default.hex}}" }
  preview_hovered = { bg = "{{colors.surface_variant.default.hex}}" }
  border_style    = { fg = "{{colors.outline.default.hex}}" }

  [status]
  separator_open  = ""
  separator_close = ""
  
  # Normal Mode
  primary_normal   = { bg = "{{colors.primary.default.hex}}", fg = "{{colors.on_primary.default.hex}}", bold = true }
  secondary_normal = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" }
  tertiary_normal  = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }

  # Select Mode
  primary_select   = { bg = "{{colors.tertiary.default.hex}}", fg = "{{colors.on_tertiary.default.hex}}", bold = true }
  secondary_select = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" }
  tertiary_select  = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }

  # Unset Mode
  primary_unset    = { bg = "{{colors.error.default.hex}}", fg = "{{colors.on_error.default.hex}}", bold = true }
  secondary_unset  = { bg = "{{colors.surface_variant.default.hex}}", fg = "{{colors.on_surface_variant.default.hex}}" }
  tertiary_unset   = { bg = "{{colors.surface.default.hex}}", fg = "{{colors.on_surface.default.hex}}" }

  [select]
  border   = { fg = "{{colors.primary.default.hex}}" }
  active   = { fg = "{{colors.primary.default.hex}}", bold = true }
  inactive = { fg = "{{colors.on_surface.default.hex}}" }

  [input]
  border   = { fg = "{{colors.primary.default.hex}}" }
  title    = { fg = "{{colors.primary.default.hex}}", bold = true }
  value    = { fg = "{{colors.on_surface.default.hex}}" }
  selected = { bg = "{{colors.secondary_container.default.hex}}" }

  [completion]
  border   = { fg = "{{colors.primary.default.hex}}" }
  active   = { bg = "{{colors.secondary_container.default.hex}}", fg = "{{colors.on_secondary_container.default.hex}}" }
  inactive = { fg = "{{colors.on_surface.default.hex}}" }

  [tasks]
  border  = { fg = "{{colors.primary.default.hex}}" }
  title   = { fg = "{{colors.primary.default.hex}}", bold = true }
  hovered = { bg = "{{colors.secondary_container.default.hex}}", fg = "{{colors.on_secondary_container.default.hex}}" }
'';
}
