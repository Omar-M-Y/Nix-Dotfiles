{
  mainBar = {
    layer = "top";
    position = "top";
    reload_style_on_change = true;

    modules-left = [ "custom/notification" "clock" "tray" ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right = [ "group/expand" "bluetooth" "network" "battery" ];

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        active = "";
        default = "";
        empty = "";
      };
      persistent-workspaces = {
        "*" = [ 1 2 3 4 5 ];
      };
    };

    "custom/notification" = {
      tooltip = false;
      format = "";
      on-click = "swaync-client -t -sw";
      escape = true;
    };

    clock = {
      format = "{:%I:%M:%S %p} ";
      interval = 1;
      tooltip-format = "<tt>{calendar}</tt>";
      calendar = {
        format = {
          today = "<span color='#fAfBfC'><b>{}</b></span>";
        };
      };
      actions = {
        on-click-right = "shift_down";
        on-click = "shift_up";
      };
    };

    network = {
      # --- Formats (Icons only) ---
      # Wi-Fi: Uses the dynamic 'format-icons' list below based on signal strength
      format-wifi = "{icon}";
      
      # Ethernet: Uses a static cable icon
      format-ethernet = "";
      
      # Disconnected: A slashed icon
      format-disconnected = "";

      # (Optional) Linked: connected to cable but no IP
      format-linked = " (No IP)";

      # --- Icons ---
      # Define the icon progression for Wi-Fi signal strength (0% to 100%)
      format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];

      # --- Tooltips (Rich Information) ---
      # Since the bar only shows icons, we keep the detailed info in the hover tooltip
      tooltip-format-wifi = "  {essid} ({signalStrength}%)\nFrequency: {frequency}MHz\nIP: {ipaddr}";
      tooltip-format-ethernet = "  {ifname}\nIP: {ipaddr}";
      tooltip-format-disconnected = "Disconnected";

      # --- Actions ---
      # Left Click: Open GUI Network Manager
      on-click = "nm-connection-editor";
    };

    bluetooth = {
      format-on = "󰂯";
      format-off = "BT-off";
      format-disabled = "󰂲";
      format-connected-battery = "{device_battery_percentage}% 󰂯";
      format-alt = "{device_alias} 󰂯";
      tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
      tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
      on-click-right = "blueman-manager";
    };

    battery = {
      interval = 30;
      states = {
        good = 95;
        warning = 30;
        critical = 20;
      };
      format = "{capacity}% {icon}";
      format-charging = "{capacity}% 󰂄";
      format-plugged = "{capacity}% 󰂄 ";
      format-alt = "{time} {icon}";
      format-icons = [ "󰁻" "󰁼" "󰁾" "󰂀" "󰂂" "󰁹" ];
    };

    "custom/expand" = {
      format = "";
      tooltip = false;
    };

    "custom/endpoint" = {
      format = "|";
      tooltip = false;
    };

    "group/expand" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        transition-to-left = true;
        click-to-reveal = true;
      };
      modules = [ "custom/expand" "custom/colorpicker" "cpu" "memory" "temperature" "custom/endpoint" ];
    };

    "custom/colorpicker" = {
      format = "{}";
      return-type = "json";
      interval = "once";
      exec = "~/.config/waybar/scripts/colorpicker.sh -j";
      on-click = "~/.config/waybar/scripts/colorpicker.sh";
      signal = 1;
    };

    cpu = {
      format = "󰻠";
      tooltip = true;
    };

    memory = {
      format = "";
    };

    temperature = {
      critical-threshold = 80;
      format = "";
    };

    tray = {
      icon-size = 14;
      spacing = 10;
    };
  };
}
