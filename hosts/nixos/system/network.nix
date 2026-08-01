{ ... }: {
    networking = {
        hostName = "Yahya-PC";
        networkmanager.enable = true;
        nameservers = [ "1.1.1.1" ];
        firewall = {
            allowedTCPPorts = [ 7000 7001 7100 ];
            allowedUDPPorts = [ 6000 6001 6100 ];
        };
    };
}
