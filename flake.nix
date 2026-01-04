{
	description = "Nix-OS config";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
		quickshell = {
			url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		mac-style-plymouth = {
			url = "github:SergioRibera/s4rchiso-plymouth-theme";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nix-cachyos-kernel = {
			url = "github:xddxdd/nix-cachyos-kernel/release";
		};
    nix-flatpak = {
        url = "github:gmodena/nix-flatpak";
      };
		matugen = {
			url = "github:InioX/Matugen";
		};
    ambxst = {
        url = "github:Axenide/Ambxst";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
      };
	};
	outputs = { self, nixpkgs, quickshell, mac-style-plymouth, nix-cachyos-kernel, nix-flatpak, matugen, home-manager, ambxst, zen-browser ... }@inputs: {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
        nix-flatpak.nixosModules.nix-flatpak
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.yahya = import ./home.nix;

					home-manager.extraSpecialArgs = { inherit inputs; };
				}
        {
          nixpkgs.config.allowUnfree = true;
        }
			{
				nixpkgs.overlays = [
					mac-style-plymouth.overlays.default
					nix-cachyos-kernel.overlays.pinned
					];
				}
			];
		};
    # ADD THIS SECTION so 'home-manager switch' works:
    homeConfigurations."yahya" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # match your system
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home.nix ];
    };
	};
}
