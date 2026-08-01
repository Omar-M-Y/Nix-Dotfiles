{ pkgs, ... }: {
    security.rtkit.enable = true;
    
    services.pipewire = {
        enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
        extraConfig.pipewire."99-latency" = {
            "context.properties" = {
                "default.clock.rate" = 48000;
                "default.clock.quantum" = 512;
                "default.clock.min-quantum" = 128;
                "default.clock.max-quantum" = 1024;
            };
        };
    };
}
