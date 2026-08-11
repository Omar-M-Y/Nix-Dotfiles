{ inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
    ./config/environment.nix
    ./config/keybinds.nix
    ./config/input.nix
    ./config/monitors.nix
    ./config/animations.nix
    ./config/autostart.nix
  ];

  programs.niri = {
    enable = true;
    settings = {

      prefer-no-csd = true;

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      hotkey-overlay.skip-at-startup = true;

      layout = {
        gaps = 8;
        center-focused-column = "never";

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5;     }
          { proportion = 0.66667; }
        ];

        default-column-width = { proportion = 0.5; };

        focus-ring = {
          enable   = true;
          width    = 2;
          active   = { color = "#98f7ff"; };
          inactive = { color = "#0d1515"; };
        };

        border.enable = false;

        shadow = {
          enable   = true;
          softness = 30.0;
          spread   = 5.0;
          offset   = { x = 0; y = 5; };
          color    = "#00000070";
        };
      };

      window-rules = [
        {
          geometry-corner-radius = {
            top-left     = 18.0;
            top-right    = 18.0;
            bottom-left  = 18.0;
            bottom-right = 18.0;
          };
          clip-to-geometry = true;
        }
      ];

    };
  };
}
