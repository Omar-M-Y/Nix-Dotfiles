{
	description = "Nix-OS config";
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		quickshell = {
			url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		mac-style-plymouth = {
			url = "github:SergioRibera/s4rchiso-plymouth-theme";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		cachyos-nix = {
			url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
		};
		matugen = {
			url = "github:/InioX/Matugen";
		};
	};
	outputs = { self, nixpkgs, quickshell, mac-style-plymouth, cachyos-nix, matugen, home-manager, ... }@inputs: {
		nixosConfigurations.vm = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				cachyos-nix.nixosModules.default
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.yahya = import ./home.nix;

					home-manager.extraSpecialArgs = { inherit inputs; };
				}
			{
				nixpkgs.overlays = [
					mac-style-plymouth.overlays.default
					];
				}
			];
		};
	};
}
