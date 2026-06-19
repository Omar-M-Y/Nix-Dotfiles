# hosts/nixos/hardware/nvidia.nix
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

  #  home-manager.users.yahya = {
  #    home.sessionVariables = {
  #      LIBVA_DRIVER_NAME = "nvidia";
  #      # GBM_BACKEND = "nvidia-drm";
  #      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  #    };
  #  };
}
