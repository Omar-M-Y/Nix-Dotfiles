{ config, pkgs, ... }: {

    services.xserver.videoDrivers = [ "nvidia" ];
    
    hardware = {
        nvidia = {
            modesetting.enable = true;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
            powerManagement = {
                enable = true;
                finegrained = false;
            };
        };
        graphics = {
            enable = true;
            enable32Bit = true;
        };
    };
    
    environment.sessionVariables = {
        LIBVA_DRIVER_NAME         = "nvidia";
        GBM_BACKEND               = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        NVD_BACKEND               = "direct";
        NIXOS_OZONE_WL            = "1";
        XDG_SESSION_TYPE          = "wayland";
    };
}
