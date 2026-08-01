{ pkgs, ... }:

{
    programs.hyprland = {
        enable       = true;
        withUWSM     = true;
        xwayland.enable = true;
    };

    services.greetd = {
        enable = true;
        settings = {
            default_session = {
                # command = "${pkgs.cage}/bin/cage -s -- ${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
                command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland --time --remember";
                user    = "greeter";
          };
        };
    };

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
        cage # Cage — minimal Wayland compositor for greetd/Quickshell greeter
    ];
}
