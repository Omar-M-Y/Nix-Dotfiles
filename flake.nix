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

    viu.url = "github:viu-media/viu";
  };

  outputs = { self, nixpkgs, nix-darwin, home-manager, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos/default.nix
        home-manager.nixosModules.home-manager
        # Combined Nixpkgs config into one module block to avoid syntax errors
        {
          nixpkgs.config.allowUnfree = true;
          nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ];
        }
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; isDarwin = false; };
            users.yahya = {
              imports = [ ./home/nixos.nix ];
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
          # Added allowUnfree here for the Mac system side
          nixpkgs.config.allowUnfree = true;
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; isDarwin = true; };
            users.yahya = {
              imports = [ ./home/darwin.nix ];
            };
          };
        }
      ];
    };

    homeConfigurations = {
      "yahya@desktop" = home-manager.lib.homeManagerConfiguration {
        # Configure the pkgs instance directly for standalone HM
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; isDarwin = false; };
        modules = [ ./home/nixos.nix ];
      };

      "yahya@mac" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs; isDarwin = true; };
        modules = [ ./home/darwin.nix ];
      };
    };
  };
}
