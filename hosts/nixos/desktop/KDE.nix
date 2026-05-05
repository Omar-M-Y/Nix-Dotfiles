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
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
}
