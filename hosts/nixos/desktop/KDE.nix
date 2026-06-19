{ pkgs, ... }: {

  services = {
    desktopManager = {
      plasma6.enable = true;
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    configPackages = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };

  environment.sessionVariables = {
    # KWIN_DRM_NO_AMS = "1";
    # XDG_CURRENT_DESKTOP = "KDE";  # ensures portal picks the right backend
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";

  };

}
