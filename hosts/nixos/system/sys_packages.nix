{ pkgs, inputs, ... }: {
  environment = {
    systemPackages = with pkgs; [
    vim
    # google-chrome
    nvtopPackages.nvidia
    xsensors
    os-prober
    sbctl
    imagemagick
    fuzzel

    networkmanagerapplet
    kdePackages.wallpaper-engine-plugin
    # blueman
    playerctl
    pwvucontrol
    ffmpeg
    brightnessctl
    ddcutil
    jq
    wl-clipboard
    grim
    slurp
    upower
    # gpu-screen-recorder
    tesseract
    pipx
    # tmux

    killall
    fastfetch
    # coolercontrol.coolercontrol-gui
    # coolercontrol.coolercontrold
    liquidctl

    #inputs.matugen.packages.${pkgs.system}.default
    (sddm-astronaut.override {
      embeddedTheme = "cyberpunk";
    })
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qtimageformats
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.dolphin
    kdePackages.qt5compat
    kdePackages.qt6ct
    ];
  };
}
