{
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
        
        # Mac
        nix-darwin = {
            url = "github:LnL7/nix-darwin/nix-darwin-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        matugen = {
            url = "github:InioX/Matugen";
            inputs.nixpkgs.follows = "nixpkgs-unstable";
        };
        
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
        nix-flatpak.url = "github:gmodena/nix-flatpak";
        
        noctalia = {
            # url = "github:noctalia-dev/noctalia";
            url = "github:noctalia-dev/noctalia/cachix";
            # inputs.nixpkgs.follows = "nixpkgs";
        };
        noctalia-greeter = {
            url = "github:noctalia-dev/noctalia-greeter";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
        outputs = {self, nixpkgs, nixpkgs-unstable, ... }@inputs:
        let
            lib = import ./lib { inherit inputs; };
        in
        {
            nixosConfigurations = {
                desktop = lib.mkHost { hostname = "nixos"; };
            };
            
            darwinConfigurations = {
                mac = lib.mkDarwin { hostname = "darwin"; };
            };
            
            homeConfigurations = {
                "yahya@desktop" = lib.mkHome {
                    system = "x86_64-linux";
                    isDarwin = false;
                    homeFile = ./home/nixos.nix;
                };
                "yahya@mac" = lib.mkHome {
                    system = "aarch64-darwin";
                    isDarwin = true;
                    homeFile = ./home/darwin.nix;
                };
            };
        };
}
