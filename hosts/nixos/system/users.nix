{ pkgs, ... }: {
    users = {
        users = {
            yahya = {
                isNormalUser = true;
                description = "yahya";
                extraGroups = [ "networkmanager" "wheel" "video" "input" "i2c" ];
                shell = pkgs.fish;
            };
            greeter = {
                isSystemUser = true;
                group = "greeter";
            };
        };
        groups.greeter = {};
    };
}
