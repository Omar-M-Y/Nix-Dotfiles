{ pkgs, lib, inputs, ... }:

{
    programs.hyprland = {
        enable       = true;
        withUWSM     = true;
        xwayland.enable = true;
    };

    # services.greetd = {
    #     enable = true;
    #     settings = {
    #         terminal.vt = 1;
    #       };
    #   };
# services.greetd = {
#   enable = true;
#   settings = {
#     terminal.vt = 1;
#     default_session = {
#       command = let
#         hyprlandConfig = pkgs.writeText "hyprland-greeter.conf" ''
#           exec-once = ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter; hyprctl dispatch exit
#
#           env = XCURSOR_THEME,Bibata-Modern-Classic
#           env = XCURSOR_SIZE,24
#           env = HYPRCURSOR_SIZE,24
#
#           monitor = DP-1, 1920x1080@240, 0x0, 1
#           monitor = HDMI-A-1, disable
#
#           animations {
#             enabled = false
#           }
#           cursor {
#             no_hardware_cursors = true
#           }
#           misc {
#             background_color = rgba(0E0E0EFF)
#             disable_hyprland_logo = true
#             disable_splash_rendering = true
#           }
#         '';
#       # Redirect stdout and stderr so startup text never hits VT1 directly
#       in "${pkgs.bash}/bin/bash -c 'exec env PATH=${pkgs.uwsm}/bin:$PATH HYPRLAND_CONFIG=${hyprlandConfig} ${pkgs.hyprland}/bin/start-hyprland >/dev/null 2>&1'";
#       user = "greeter";
#     };
#   };
# };

#  services.greetd = {
#   enable = true;
#   settings = {
#     terminal.vt = 1;
#     default_session = {
#       command = let
#         hyprlandConfig = pkgs.writeText "hyprland-greeter.conf" ''
#           exec-once = ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter
#
#           env = XCURSOR_THEME,Bibata-Modern-Classic
#           env = XCURSOR_SIZE,24
#           env = HYPRCURSOR_SIZE,24
#
#           monitor = DP-1, 1920x1080@240, 0x0, 1
#           monitor = HDMI-A-1, disable
#
#           animations {
#             enabled = false
#           }
#           cursor {
#             no_hardware_cursors = true
#           }
#           misc {
#             background_color = rgba(0E0E0EFF)
#             disable_hyprland_logo = true
#             disable_splash_rendering = true
#           }
#         '';
#       in "env HYPRLAND_CONFIG=${hyprlandConfig} ${pkgs.uwsm}/bin/uwsm start hyprland.desktop";
#       user = "greeter";
#     };
#   };
# };

    # environment.etc."quickshell/greeter".source = /home/yahya/quickshell-desktop/greeter;

}
