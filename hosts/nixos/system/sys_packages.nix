{ pkgs, inputs, ... }: {
    environment = {
        systemPackages = with pkgs; [
            vim
            xsensors
            os-prober
            sbctl
            imagemagick
            fuzzel
            networkmanagerapplet
            playerctl
            pwvucontrol
            ffmpeg
            brightnessctl
            ddcutil
            jq
            wl-clipboard
            grim
            slurp
            pipx
            killall
            fastfetch
        ];
    };
}
