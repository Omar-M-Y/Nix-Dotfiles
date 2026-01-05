{ pkgs, inputs, config, ... }: {

  imports = [
    ./config/monitors.nix
    ./config/keybinds.nix
    ./config/settings.nix
    ./config/animations.nix
    ./config/input.nix
    ./config/windowrules.nix
    ./config/autostart.nix
    ./config/environment.nix
    ./hyprlock.nix
    ./hypridle.nix
    ../pywal.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    # DECLARATIVE CONFIGURATION
    settings = {
      
      # 1. Source the Pywal colors
      source = "${config.home.homeDirectory}/.cache/wal/colors-hyprland.conf";

      # 2. General Settings
      general = {
        gaps_in = 3;
        gaps_out = 3;
        border_size = 2;
        
        # Pywal Color Mappings:
        # $color14 -> Accent (Cyan/Primary)
        # $color8  -> Muted (Grey/Outline)
        "col.active_border" = "$color14";
        "col.inactive_border" = "$color8";
        
        layout = "dwindle";
        allow_tearing = false;
        
        snap = {
          enabled = true;
        };
      };

      # 3. Decoration
      decoration = {
        active_opacity = 0.9;
        inactive_opacity = 0.75;
        rounding = 18;
        dim_inactive = true;
        dim_strength = 0.1;

        blur = {
          enabled = true;
          xray = true;
          size = 3;
          passes = 4;
          new_optimizations = true;
          ignore_opacity = true;
        };

        shadow = {
          enabled = true;
          range = 6;
          
          # Shadow uses accent ($color14) and background ($color0)
          color = "$color14";
          color_inactive = "$color0";
          ignore_window = true;
        };
      };

      # 4. Group
      group = {
        "col.border_active" = "$color14";
        "col.border_inactive" = "$color8";
        
        groupbar = {
          text_color = "$foreground";
          "col.active" = "$color14";
          "col.inactive" = "$color0";
          "col.locked_active" = "$color4"; # Secondary accent
          "col.locked_inactive" = "$color8";
          font_family = "Fira Sans";
        };
      };

      # 5. Misc
      misc = {
        font_family = "Fira Sans";
        splash_font_family = "Fira Sans";
        disable_hyprland_logo = true;
        "col.splash" = "$color14";
        background_color = "$background";
        enable_swallow = true;
        swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$";
        focus_on_activate = true;
        vfr = true;
        vrr = 2;
      };
    };
  };

  home.sessionVariables = { 
    NIXOS_OZONE_WL = "1"; 
  };

  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
    pkgs.kitty
    pkgs.libnotify
    pkgs.swww
    pkgs.networkmanagerapplet
  ];
}
