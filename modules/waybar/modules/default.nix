{
    "hyprland/window" = {
      max-length = 100;
      separate-output = false;
      };

    "hyprland/workspaces" = {
        format = "{name}";
        format-icons = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
          };
          sort-by-number = true;
          all-outputs = false;
          active-only = false;
          on-click = "activate";
      };

      "clock" = {
          format = "{:%a %e %b %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          today-format = "<b>{}</b>";
          # on-click = 
        };

      "tray" = {
          icon-size = 16;
          spacing = 8;
          show-passive-items = true;
        };

    
  }
