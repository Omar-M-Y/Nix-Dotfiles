{
    description = "Overall Configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

        nix-darwin = {
            url = "github:LnL7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

#        plasma-manager = {
#            url = "github:nix-community/plasma-manager";
#            inputs.nixpkgs.follows = "nixpkgs";
#            inputs.home-manager.follows = "home-manager";
#          };

        matugen = {
            url = "github:InioX/Matugen";
            inputs.nixpkgs.follows = "nixpkgs-unstable";
          };

        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

        nix-flatpak.url = "github:gmodena/nix-flatpak";

        noctalia = {
            url = "github:noctalia-dev/noctalia-shell";
            inputs.nixpkgs.follows = "nixpkgs-unstable";
          };

        viu = {
            url = "github:viu-media/viu";
          };

    };

    outputs = { self, nixpkgs, nix-darwin, home-manager, ... }@inputs: {
        nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {inherit inputs;  };
                modules = [
                    ./hosts/nixos/default.nix
                    home-manager.nixosModules.home-manager
                    { nixpkgs.overlays = [
                        inputs.nix-cachyos-kernel.overlays.pinned
                    ];
                    }
                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            backupFileExtension = "backup";
                            extraSpecialArgs = {inherit inputs; isDarwin = false; };
                            users.yahya = {
                                imports = [
                                  ./home/nixos.nix
                                  #inputs.plasma-manager.homeModules.plasma-manager
                                ];
                            };
                        };
                    }
                ];
            };
        darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit inputs; };
            modules = [
              ./hosts/darwin/default.nix
              home-manager.darwinModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.extraSpecialArgs = { inherit inputs; isDarwin = true; };
                home-manager.users.yahya = import ./home/darwin.nix;
              }
            ];
          };

        homeConfigurations = {
                "yahya@desktop" = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.x86_64-linux;
                    extraSpecialArgs = { inherit inputs; isDarwin = false; };
                    modules = [
                        ./home/nixos.nix
                        #inputs.plasma-manager.homeModules.plasma-manager
                        { nixpkgs.config.allowUnfree = true; }
                        ];
                    };
        };
                "yahya@mac" = home-manager.lib.homeManagerConfiguration {
                    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
                    extraSpecialArgs = { inherit inputs; isDarwin = true; };
                    modules = [
                      ./home/darwin.nix
                      { nixpkgs.config.allowUnfree = true; }
                    ];
                  };
    };
}
