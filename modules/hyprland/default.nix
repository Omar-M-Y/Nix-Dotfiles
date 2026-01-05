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
		../matugen.nix
	];

	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		extraConfig = ''
		
		source = ~/.config/hypr/colors.conf

		general {
        gaps_in = 3
        gaps_out = 3
        border_size = 2
        col.active_border = $primary
        col.inactive_border = $outline
        layout = dwindle
        allow_tearing = false
        snap {
            enabled = true
        }
      }

      decoration {
        active_opacity = 0.9
        inactive_opacity = 0.75
        rounding = 18 
        dim_inactive = true
        dim_strength = 0.1

        blur {
          enabled = true
          xray = true
          size = 3
          passes = 4
          new_optimizations = true
          ignore_opacity = true
        }

        shadow {
          enabled = true
          range = 6
          color = $primary
          color_inactive = $surface_variant
          ignore_window = true
        }
      }

      group {
        col.border_active = $primary
        col.border_inactive = $outline
        groupbar {
          text_color = $on_surface
          col.active = $primary
          col.inactive = $surface_variant
          col.locked_active = $secondary
          col.locked_inactive = $outline
          font_family = Fira Sans
        }
      }

      misc {
        font_family = Fira Sans
        splash_font_family = Fira Sans
        disable_hyprland_logo = true
        col.splash = $primary
        background_color = $surface
        enable_swallow = true
        swallow_regex = ^(nautilus|nemo|thunar|btrfs-assistant.)$
        focus_on_activate = true
        vfr = true
        vrr = 2
      }
    	'';
	};

	home.sessionVariables = { 
		NIXOS_OZONE_WL = "1"; 
	};

	home.packages = [
		inputs.quickshell.packages.${pkgs.system}.default

		pkgs.kitty  # Terminal
		pkgs.libnotify  #
		pkgs.swww # Wallpaper Daemon
		pkgs.networkmanagerapplet
	];
}
