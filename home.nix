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
              verboseecho "refreshing font cache..."
              $dry_run_cmd ${pkgs.fontconfig}/bin/fc-cache -r
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

    #
    # home.packages = with pkgs; [
    #     inputs.quickshell.packages.${pkgs.system}.default
    #     (writeShellScriptBin "set-wallpaper" ''
    #         if [ -z "$1" ]; then
    #         echo "Usage: set-wallpaper <path/to/image>"
    #         exit 1
    #         fi
    #
    #         # 1. Change the wallpaper
    #         swww img "$1" --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 --transition-fps 60
    #
    #         # 2. Generate colors (Matugen)
    #         matugen image "$1"
    #
    #         # 3. RELOAD KITTY MANUALLY
    #         # Since we know this works in your terminal, running it here 
    #         # ensures it executes with the correct permissions and environment.
    #         ${pkgs.procps}/bin/pkill -SIGUSR1 kitty
    #
    #         # Reload Waybar/Hyprland if needed
    #         ${pkgs.procps}/bin/pkill -SIGUSR2 waybar
    #         ${pkgs.hyprland}/bin/hyprctl reload
    #     '')
    #     nerd-fonts.meslo-lg
    #     nerd-fonts.symbols-only
    #     noto-fonts
    #     noto-fonts-cjk-sans
    #     noto-fonts-color-emoji
    #
    #     gcc           # Required for Treesitter compilation
    #     gnumake
    #     unzip
    #     wget
    #     curl
    #
    #     # -- Search Tools --
    #     ripgrep       # Required for Telescope
    #     fd
    #
    #     # -- LSP Servers & Formatters --
    #     # Add the ones you use!
    #     lua-language-server
    #     nil           # Nix LSP
    #     nixpkgs-fmt   # Nix Formatter
    #     stylua        # Lua Formatter
    #     nodePackages.typescript-language-server
    #
    #     # microsoft-edge
    #     easyeffects
    #     btop
    #     discord
    #    efibootmgr
    #     pavucontrol
    #     alsa-utils
    #     home-manager
    #     inputs.viu.packages.${pkgs.system}.default
    #     wootility
    #
    #
    #     # rofi
    #
    # ];


  

  


    # home = {
    #     stateVersion = "25.11";
    #     sessionVariables = {
    #         LIBVA_DRIVER_NAME = "nvidia";
    #         XDG_SESSION_TYPE = "wayland";
    #         GBM_BACKEND = "nvidia-drm";
    #         __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    #       };
    #     username = "yahya";
    #     homeDirectory = "/home/yahya";
    #   };
}
