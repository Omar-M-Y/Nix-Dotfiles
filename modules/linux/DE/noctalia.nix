{ pkgs, inputs, ... }:
let
  matugen = inputs.matugen.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {

      # ── Accessibility ──────────────────────────────────────────────────────
      accessibility = {
        ui_scale     = 1.0;
        high_contrast = false;
      };

      # ── Shell ──────────────────────────────────────────────────────────────
      shell = {
        corner_radius_scale                  = 2.0;
        font_family                          = "sans-serif";
        time_format                          = "{:%H:%M}";
        date_format                          = "%A, %x";
        offline_mode                         = false;
        telemetry_enabled                    = false;
        niri_overview_type_to_launch_enabled = false;
        polkit_agent                         = false;
        password_style                       = "default";
        settings_show_advanced               = true;
        show_location                        = true;
        clipboard_enabled                    = true;
        clipboard_history_max_entries        = 100;
        clipboard_keep_from_closed_apps      = true;
        clipboard_auto_paste                 = "auto";
        clipboard_image_action_command       = "";
        shared_gl_context                    = true;

        privacy = {
          mic_filter_regex    = "";
          cam_filter_regex    = "";
          screen_filter_regex = "";
        };

        animation = {
          enabled = true;
          speed   = 1.0;
        };

        shadow = {
          direction = "down";
          alpha     = 0.55;
        };

        panel = {
          transparency_mode              = "solid";
          borders                        = true;
          shadow                         = true;
          launcher_placement             = "floating";
          clipboard_placement            = "floating";
          control_center_placement       = "attached";
          wallpaper_placement            = "attached";
          session_placement              = "attached";
          launcher_position              = "center";
          clipboard_position             = "center";
          open_near_click_control_center = false;
          open_near_click_launcher       = false;
          open_near_click_clipboard      = false;
          open_near_click_wallpaper      = false;
          open_near_click_session        = false;
        };

        launcher = {
          categories           = true;
          show_icons           = true;
          compact              = false;
          app_grid             = false;
          sort_by_usage        = true;
          pinned               = [];
          fetch_exchange_rates = true;
          provider_prefix      = "/";
          auto_paste           = "auto";

          providers = {
            calculator = { prefix = "calc"; global = true;  };
            emoji      = { prefix = "emo";                  };
            session    = { prefix = "session"; global = false; };
            wallpaper  = { prefix = "wall";                 };
            windows    = { prefix = "win";                  };
          };
        };

        mpris.blacklist = [];
      };

      # ── Wallpaper ──────────────────────────────────────────────────────────
      wallpaper = {
        enabled              = true;
        fill_mode            = "crop";
        fill_color           = "";
        transition           = [ "fade" "wipe" "disc" "stripes" "zoom" "honeycomb" ];
        transition_duration  = 1500;
        edge_smoothness      = 0.3;
        transition_on_startup = false;
        directory            = "/var/lib/noctalia-greeter/wallpaper.webp";
        directory_light      = "";
        directory_dark       = "";

        default.path = "";

        automation = {
          enabled          = false;
          interval_seconds = 1800;
          order            = "random";
          recursive        = true;
        };
      };

      # ── Theme ──────────────────────────────────────────────────────────────
# In programs.noctalia.settings:

      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content"; # matches your v4 generationMethod = "content"

        templates = {
          enable_builtin_templates = true;
          builtin_ids = [ "kitty" "hyprland" "yazi" ]; # same three you had active
          enable_user_templates = false; # enable if you add custom ones later
        };
      };

# Your matugen hook — same logic, v5 hook key name
      hooks = {
        wallpaper_changed = ''
          ${matugen}/bin/matugen image $(${pkgs.jq}/bin/jq -r '.wallpapers["DP-1"].dark' ~/.cache/noctalia/wallpapers.json) --source-color-index "0"
          ${pkgs.hyprland}/bin/hyprctl reload
          ${pkgs.procps}/bin/pkill -SIGUSR1 kitty
        '';
      };

      # ── Backdrop ───────────────────────────────────────────────────────────
      backdrop = {
        enabled        = false;
        blur_intensity = 0.5;
        tint_intensity = 0.3;
      };

      # ── Notifications ──────────────────────────────────────────────────────
      notification = {
        enable_daemon      = true;
        show_app_name      = true;
        show_actions       = true;
        layer              = "top";
        scale              = 1.0;
        background_opacity = 0.97;
        offset_x           = 20;
        offset_y           = 8;
        monitors = ["DP-1"];
      };

      # ── OSD ────────────────────────────────────────────────────────────────
      osd = {
        position           = "top_right";
        position_vertical  = "top_center";
        orientation        = "horizontal";
        scale              = 1.0;
        background_opacity = 0.97;
        offset_x           = 20;
        offset_y           = 8;

        kinds = {
          volume          = true;
          volume_output   = true;
          volume_input    = true;
          brightness      = true;
          wifi            = true;
          bluetooth       = true;
          power_profile   = true;
          caffeine        = true;
          nightlight      = true;
          dnd             = true;
          lock_keys       = true;
          keyboard_layout = true;
          privacy         = true;
        };
      };

      # ── Lock Screen ────────────────────────────────────────────────────────
      lockscreen = {
        enabled        = true;
        blurred_desktop = false;
        blur_intensity = 0.5;
        tint_intensity = 0.3;
      };

      # ── System Monitor ─────────────────────────────────────────────────────
      system.monitor = {
        enabled                     = true;
        cpu_poll_seconds            = 2.0;
        cpu_freq_activity_threshold = 2.5;
        cpu_freq_critical_threshold = 4.5;
        gpu_poll_seconds            = 5.0;
        memory_poll_seconds         = 2.0;
        network_poll_seconds        = 3.0;
        disk_poll_seconds           = 10.0;
      };

      # ── Calendar ───────────────────────────────────────────────────────────
      calendar = {
        enabled         = false;
        refresh_minutes = 15;
      };

      control_center.calendar = {
        show_events_card   = true;
        show_week_numbers  = false;
        event_date_format  = "%A %e %B";
        event_time_format  = "%H:%M";
      };

      # ── Weather ────────────────────────────────────────────────────────────
      weather = {
        enabled         = false;
        refresh_minutes = 30;
        unit            = "celsius";
        effects         = true;
      };

      # ── Audio ──────────────────────────────────────────────────────────────
      audio = {
        enable_overdrive      = false;
        enable_sounds         = false;
        sound_volume          = 0.5;
        volume_change_sound   = "";
        notification_sound    = "";
      };

      # ── Brightness ─────────────────────────────────────────────────────────
      brightness.enable_ddcutil = false;

      # ── Night Light ────────────────────────────────────────────────────────
      nightlight = {
        enabled           = false;
        force             = false;
        temperature_day   = 6500;
        temperature_night = 4000;
      };

      # ── Location ───────────────────────────────────────────────────────────
      location = {
        auto_locate = false;
        address     = "";
      };

      # ── Idle ───────────────────────────────────────────────────────────────
      idle.behavior = {
        lock = {
          timeout = 600;
          action  = "lock";
          enabled = false;
        };
        "screen-off" = {         # hyphen requires quoting in Nix
          timeout = 660;
          action  = "screen_off";
          enabled = false;
        };
      };

      # ── Keybinds ───────────────────────────────────────────────────────────
      keybinds = {
        validate     = [ "return" "kp_enter" "space" ];
        cancel       = [ "escape" ];
        left         = [ "left" ];
        right        = [ "right" ];
        up           = [ "up" ];
        down         = [ "down" ];
        tab_next     = [ "tab" ];
        tab_previous = [ "shift+iso_left_tab" ];
        delete       = [ "del" ];
      };

      # ── Bar ────────────────────────────────────────────────────────────────
      bar.main = {
        position           = "top";
        thickness          = 34;
        background_opacity = 1.0;
        radius             = 12;
        margin_ends        = 180;
        margin_edge        = 0;
        padding            = 6;
        widget_spacing     = 6;
        scale              = 1.0;
        shadow             = true;
        auto_hide          = false;
        reserve_space      = true;
        capsule            = true;
        capsule_fill       = "surface_variant";
        capsule_thickness  = 0.76;          # capsule size across the bar as a fraction of bar thickness (1.0 fills the bar)
        capsule_radius     = 8.0;            # omit for automatic pill radius
        capsule_opacity    = 1.0;
        start  = [ "workspaces" "active_window" ];
        center = [ "media" ];
        end    = [  "tray" "volume" "network"
                   "bluetooth"
                   "control-center" "clock" "notifications"];
      };

      # ── Bar Widgets ────────────────────────────────────────────────────────
      
      widget = {
          active_window = {
              min_length = 0;
              max_length = 260;
              display = "icon_and_text";
              icon_size = 20;
              title_scroll = "on_hover";
              show_empty_label = true;
          };
          launcher = {
              glyph = "menu-2";
          };
      };

      control_center = {
          sidebar = "None";
      };

      # ── Dock ───────────────────────────────────────────────────────────────
      dock = {
        enabled              = false;
        position             = "bottom";
        icon_size            = 48;
        main_axis_padding    = 16;
        cross_axis_padding   = 8;
        item_spacing         = 6;
        background_opacity   = 0.88;
        radius               = 16;
        radius_top_left      = 16;
        radius_top_right     = 16;
        radius_bottom_left   = 16;
        radius_bottom_right  = 16;
        margin_ends          = 0;
        margin_edge          = 8;
        shadow               = true;
        show_running         = true;
        auto_hide            = false;
        reserve_space        = true;
        layer                = "top";
        active_scale         = 1.0;
        inactive_scale       = 0.85;
        magnification        = true;
        magnification_scale  = 1.45;
        active_opacity       = 1.0;
        inactive_opacity     = 0.85;
        show_dots            = false;
        show_instance_count  = true;
        launcher_position    = "none";
        launcher_icon        = "grid-dots";
        active_monitor_only  = false;
        pinned               = [];
      };

      # ── Desktop Widgets ────────────────────────────────────────────────────
      desktop_widgets.enabled = false;

    };
  };
}
