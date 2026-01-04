{config, pkgs, inputs, lib, ...}: {
    imports = [
        ./modules/kitty.nix
        ./modules/starship.nix
        ./modules/hyprland/default.nix
        ./modules/matugen.nix
        ./modules/quickshell/default.nix
        ./modules/rofi/default.nix
        ./modules/viu.nix
        ./modules/nvim/default.nix
        ./modules/scripts
        inputs.zen-browser.homeModules.beta 
    ];
   

    fonts.fontconfig.enable = true;

    home = {
        activation = {
            refreshfontcache = lib.hm.dag.entryAfter ["writeboundary"] ''
              verboseEcho "refreshing font cache..."
              $DRY_RUN_CMD ${pkgs.fontconfig}/bin/fc-cache -r
            '';
          };
        packages = with pkgs; [
          inputs.quickshell.packages.${pkgs.system}.default
          nerd-fonts.meslo-lg
          nerd-fonts.symbols-only
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-color-emoji

          gcc           # required for treesitter compilation
          gnumake
          unzip
          wget
          curl
          # -- search tools --
          ripgrep       # required for telescope
          fd
          # -- lsp servers & formatters --
          # # add the ones you use!
          lua-language-server
          nil           # nix lsp
          nixpkgs-fmt   # nix formatter
          stylua        # lua formatter
          nodePackages.typescript-language-server 
          easyeffects
          btop
          discord
          efibootmgr
          pavucontrol
          alsa-utils
          home-manager
          inputs.viu.packages.${pkgs.system}.default
          wootility
        ];
        stateVersion = "25.11";
        sessionVariables = {
            LIBVA_DRIVER_NAME = "nvidia";
            XDG_SESSION_TYPE = "wayland";
            GBM_BACKEND = "nvidia-drm";
            __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        };
        username = "yahya";
        homeDirectory = "/home/yahya";
      };

    programs = {
        git = {
            enable = true;
            settings = {
                user.name = "Omar-M-Y";
                user.email = "yahya.omar_@outlook.com";
                init.defaultBranch = "main";
              };
          };
          home-manager = {
              enable = false;
            };
          zen-browser = {
              enable = true;
            };
      };

    nixpkgs.config.allowUnfree = true;

}
