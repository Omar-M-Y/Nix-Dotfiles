{ pkgs, lib, ... }:

{
    programs.hyprland = {
        enable       = true;
        withUWSM     = true;
        xwayland.enable = true;
    };
services.greetd = {
  enable = true;
  settings = {
    terminal.vt = 1;
    default_session = {
      command = let
        hyprlandConfig = pkgs.writeText "hyprland-greeter.conf" ''
          exec-once = ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter; hyprctl dispatch exit

          env = XCURSOR_THEME,Bibata-Modern-Classic
          env = XCURSOR_SIZE,24
          env = HYPRCURSOR_SIZE,24

          monitor = DP-1, 1920x1080@240, 0x0, 1
          monitor = HDMI-A-1, disable

          animations {
            enabled = false
          }
          cursor {
            no_hardware_cursors = true
          }
          misc {
            background_color = rgba(0E0E0EFF)
            disable_hyprland_logo = true
            disable_splash_rendering = true
          }
        '';
      # Redirect stdout and stderr so startup text never hits VT1 directly
      in "${pkgs.bash}/bin/bash -c 'exec env PATH=${pkgs.uwsm}/bin:$PATH HYPRLAND_CONFIG=${hyprlandConfig} ${pkgs.hyprland}/bin/start-hyprland >/dev/null 2>&1'";
      user = "greeter";
    };
  };
};

    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     terminal.vt = 1;
    #     default_session = {
    #       command = "env HYPRLAND_CONFIG=${pkgs.writeText "hyprland-greeter.conf" ''
    #         exec-once = ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter
    #
    #         env = XCURSOR_THEME,Bibata-Modern-Classic
    #         env = XCURSOR_SIZE,24
    #         env = HYPRCURSOR_SIZE,24
    #
    #         monitor = DP-1, 1920x1080@240, 0x0, 1
    #         monitor = HDMI-A-1, disable
    #
    #         animations {
    #           enabled = false
    #         }
    #         cursor {
    #           no_hardware_cursors = true
    #         }
    #         misc {
    #           background_color = rgba(0E0E0EFF)
    #           disable_hyprland_logo = true
    #           disable_splash_rendering = true
    #         }
    #       ''} ${pkgs.hyprland}/bin/start-hyprland";
    #       user = "greeter";
    #     };
    #   };
    # };


    # services.greetd = {
    #     enable = true;
    #     settings = {
    #         default_session = {
    #             # command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
    #             # command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland --time --remember";
    #             #command = "${pkgs.cage}/bin/cage -s -- ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter";
    #             command = "${pkgs.cage}/bin/cage -d -s -m last -- ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter";
    #             user    = "greeter";
    #       };
    #     };
    # };
# services.greetd = {
#   enable = true;
#   settings = {
#     terminal.vt = 1;
#     default_session = {
#       command = "sh -c 'printf \"\\033[2J\\033[H\\033[?25l\" > /dev/tty1; exec env HYPRLAND_CONFIG=${pkgs.writeText "hyprland-greeter.conf" ''
#         exec-once = sleep 0.5 && ${pkgs.quickshell}/bin/quickshell -c /etc/quickshell/greeter && uwsm stop
#         ...
#       ''} uwsm start hyprland.desktop'";
#       user = "greeter";
#     };
#   };
# };
    environment.etc."quickshell/greeter".source = /home/yahya/quickshell-desktop/greeter;

    # XDG portal — KDE for screen sharing, hyprland for everything else
    xdg.portal = {
        enable = true;
        extraPortals = [
              pkgs.xdg-desktop-portal-hyprland
              pkgs.kdePackages.xdg-desktop-portal-kde
        ];
        config.hyprland = {
            default = [ "hyprland" "kde" ];
            "org.freedesktop.impl.portal.ScreenCast"  = [ "kde" ];
            "org.freedesktop.impl.portal.Screenshot"  = [ "kde" ];
        };
    };

    # Polkit agent — needed for auth popups until Quickshell agent is built
    security.polkit.enable = true;
    systemd.user.services.polkit-gnome = {
        description = "Polkit GNOME Agent";
        wantedBy    = [ "graphical-session.target" ];
        after       = [ "graphical-session.target" ];
        serviceConfig = {
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart   = "on-failure";
        };
    };

    environment.systemPackages = with pkgs; [
        polkit_gnome
        kdePackages.xdg-desktop-portal-kde
        # niri
        # cage # Cage — minimal Wayland compositor for greetd/Quickshell greeter
    ];
}
