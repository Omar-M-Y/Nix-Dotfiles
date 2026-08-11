{ pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];   

    programs = {
      noctalia = {
          enable = true;
          recommendedServices.enable = true;
      };
      noctalia-greeter = {
          enable = true;
          settings = {

            session = {
              default = "Hyprland"; # run: noctalia-greeter sessions
            };

            user = {
              default = "yahya"; # opens password step on startup; remove if unwanted
            };

            appearance = {
              scheme              = "Synced";
              password_style      = "default";
              hide_logo           = false;
              theme_mode          = "dark";
              corner_radius_scale = 1.0;
              font_family         = "sans-serif";

              # Declarative palette for the Synced scheme — wins over sync.toml when set.
              # Remove this whole block to let Noctalia's Sync Now manage colours instead.
              palette = {
                primary             = "#fff59b";
                on_primary          = "#0e0e43";
                secondary           = "#a9aefe";
                on_secondary        = "#0e0e43";
                tertiary            = "#9BFECE";
                on_tertiary         = "#0e0e43";
                error               = "#FD4663";
                on_error            = "#0e0e43";
                surface             = "#070722";
                on_surface          = "#f3edf7";
                surface_variant     = "#11112d";
                on_surface_variant  = "#7c80b4";
                outline             = "#21215F";
                shadow              = "#070722";
                hover               = "#9BFECE";
                on_hover            = "#0e0e43";
              };

              wallpaper = {
                path      = "/home/yahya/Pictures/Wallpapers/";
                fill_mode = "crop";
              };
            };

            output = {
              name   = "DP-1";           # pin to one monitor; omit to show on all
              # layout = "DP-1:0,0; DP-2:2560,0";
              width  = 1920;
              height = 1080;
              transforms = "DP-1:normal";
              scales     = "DP-1:1";
              scale      = 1.0;
            };

            idle = {
              timeout = 300; # seconds; 0 disables blanking
            };

            cursor = {
              theme = "Bibata-Modern-Ice";
              size  = 24;
              path  = "${pkgs.bibata-cursors}/share/icons";
            };

            keyboard = {
              layout  = "us";
              # variant = "";
              # options = "grp:alt_shift_toggle";
              numlock = true;
            };

            auth = {
              allow_empty_password = false;
            };
          };
        };
    };
}

