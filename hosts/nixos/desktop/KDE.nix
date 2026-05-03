{ ... }: {

    services = {
        displayManager = {
            sddm.enable = true;
            };
        desktopManager = {
            plasma6.enable = true;
        };
    };



    environment.sessionVariables = {
      KWIN_DRM_NO_AMS = "1";
      KWIN_FORCE_SW_CURSOR = "1";  # this is the actual fix
    };
}
