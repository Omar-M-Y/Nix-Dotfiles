{
  # --------------------------------------------------------------------------
  # Global Waybar Configuration
  # --------------------------------------------------------------------------
  reload_style_on_change = true;
  layer = "bottom";
  position = "top";
  height = 36;
  
  margin-left = 0;
  margin-bottom = 0;
  margin-right = 0;

  modules-left = [
    "hyprland/workspaces"
  ];

  modules-center = [
    "hyprland/window"
  ];

  modules-right = [
    "group/expand"
    "custom/weather"
    "bluetooth"
    "tray"
    "clock"
    "custom/power"
  ];

  # --------------------------------------------------------------------------
  # Modules
  # --------------------------------------------------------------------------

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
    modules = [
      "custom/expand"
      "memory"
      "cpu"
      "temperature"
      "custom/gpu-temp"
      "custom/endpoint"
    ];
  };

  "custom/rofi" = {
    format = "\udb82\udcc7";
    tooltip = false;
    on-click = "~/.config/rofi/launchers/launcher-2.sh";
  };

  clock = {
    format = "{:%a %e %b %H:%M}";
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    today-format = "<b>{}</b>";
    on-click = "swaync-client -t";
  };

  bluetooth = {
    format = " {status}";
    format-disabled = " Off";
    format-connected = " {device_alias}";
    format-connected-battery = " {device_alias} {device_battery_percentage}%";
    format-icons = {
      connected = "";
      disabled = "";
    };
    on-click = "blueman-manager";
    on-click-right = "wl-copy $(bluetoothctl show | grep 'Controller ' | head -n1 | cut -d ' ' -f 3)";
    on-click-middle = "rfkill toggle bluetooth";
    tooltip-format = "{device_alias}\n{device_address}";
    tooltip-format-connected = " {device_alias}\n{device_address}\nBattery: {device_battery_percentage}%";
    tooltip-format-disabled = "Bluetooth Off";
  };

  network = {
    format-wifi = " {essid} ({signalStrength}%)";
    format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
    format-linked = "{ifname} (No IP) ";
    format = "";
    format-disconnected = "";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
    on-click = "wl-copy $(ip address show up scope global | grep inet | head -n1 | cut -d/ -f 1 | tr -d [:space:] | cut -c5-)";
    on-click-right = "wl-copy $(ip address show up scope global | grep inet6 | head -n1 | cut -d/ -f 1 | tr -d [:space:] | cut -c6-)";
    tooltip-format = " {bandwidthUpBits}  {bandwidthDownBits}\n{ifname}\n{ipaddr}/{cidr}\n";
    tooltip-format-wifi = " {essid} {frequency}MHz\nStrength: {signaldBm}dBm ({signalStrength}%)\nIP: {ipaddr}/{cidr}\n {bandwidthUpBits}  {bandwidthDownBits}";
    interval = 10;
  };

  temperature = {
    thermal-zone = 3;
    interval = 4;
    critical-threshold = 80;
    format-critical = "  {temperatureC}°C";
    format = "{icon}  {temperatureC}°C";
    format-icons = [ "" "" "" ];
    max-length = 7;
    min-length = 7;
    on-click = "xsensors";
  };

  "custom/gpu-temp" = {
    exec = "nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits";
    return-type = "text";
    format = " {}°C";
    interval = 4;
    max-length = 7;
    min-length = 7;
    on-click = "kitty nvtop";
  };

  cpu = {
    interval = 1;
    format = "\uf4bc  {usage}%";
    max-length = 13;
  };

  memory = {
    interval = 30;
    format = "  {percentage}%";
    on-click = "kitty -e btop";
  };

  "custom/storage" = {
    format = " {}";
    format-alt = "{percentage}% ";
    format-alt-click = "click-right";
    return-type = "json";
    interval = 60;
    exec = "~/.config/waybar/modules/storage.sh";
  };

  "custom/power" = {
    format = "\u23fb";
    tooltip = false;
    on-click = "~/.config/rofi/power-menu/rofi-powermenu.sh";
  };

  "custom/weather" = {
    format = "{}";
    format-alt = "{alt}: {}";
    format-alt-click = "click-right";
    interval = 3600;
    exec = "curl -s 'https://wttr.in/London?format=1'";
    exec-if = "ping wttr.in -c1";
  };

  "custom/swaync" = {
    format = "{}";
    tooltip = true;
    exec = "swaync-client -swb";
    return-type = "json";
    on-click = "swaync-client -t";
    on-click-right = "swaync-client -d";
  };

  "hyprland/window" = {
    max-length = 100;
    separate-outputs = false;
  };

  "hyprland/workspaces" = {
    all-outputs = false;
    format = "{name}";
    format-icons = {
      "1" = "١";
      "2" = "٢";
      "3" = "٣";
      "4" = "٤";
      "5" = "٥";
      "6" = "٦";
      "7" = "٧";
      "8" = "٨";
      "9" = "٩";
      "10" = "١٠";
    };
    on-scroll-up = "hyprctl dispatch workspace e+1 1>/dev/null";
    on-scroll-down = "hyprctl dispatch workspace e-1 1>/dev/null";
    sort-by-number = true;
    active-only = false;
    on-click = "activate";
  };

  tray = {
    icon-size = 16;
    spacing = 8;
    show-passive-items = true;
  };
}
