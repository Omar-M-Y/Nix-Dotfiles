{config, pkgs, inputs, ...}: {
    imports = [
        ./modules/kitty.nix
        ./modules/starship.nix
        ./modules/hyprland/default.nix
        ./modules/matugen.nix
        ./modules/quickshell/default.nix
    ];

    programs = {
        git = {
            enable = true;
            settings = {
                user.name = "Omar-M-Y";
                user.email = "yahya.omar_@outlook.com";
                init.defaultBranch = "main";
              };
          };
        neovim = {
            enable = true;
            defaultEditor = true;
            viAlias = true;
            vimAlias = true;

            withNodeJs = true;
            withPython3 = true;
          };
          home-manager = {
              enable = false;
            };
      };


    xdg.configFile."nvim".source = ./modules/nvim;
    # Correct usage:
    # xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos-config/modules/nvim";
   
    home.packages = with pkgs; [
        inputs.quickshell.packages.${pkgs.system}.default
        (writeShellScriptBin "set-wallpaper" ''
            if [ -z "$1" ]; then
            echo "Usage: set-wallpaper <path/to/image>"
            exit 1
            fi

            # 1. Change the wallpaper
            swww img "$1" --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 --transition-fps 60

            # 2. Generate colors (Matugen)
            matugen image "$1"

            # 3. RELOAD KITTY MANUALLY
            # Since we know this works in your terminal, running it here 
            # ensures it executes with the correct permissions and environment.
            ${pkgs.procps}/bin/pkill -SIGUSR1 kitty
            
            # Reload Waybar/Hyprland if needed
            ${pkgs.procps}/bin/pkill -SIGUSR2 waybar
            ${pkgs.hyprland}/bin/hyprctl reload
        '')
        nerd-fonts.meslo-lg

        gcc           # Required for Treesitter compilation
        gnumake
        unzip
        wget
        curl

        # -- Search Tools --
        ripgrep       # Required for Telescope
        fd

        # -- LSP Servers & Formatters --
        # Add the ones you use!
        lua-language-server
        nil           # Nix LSP
        nixpkgs-fmt   # Nix Formatter
        stylua        # Lua Formatter
        nodePackages.typescript-language-server

        # microsoft-edge
        easyeffects
        btop
        discord
        # steam
	      efibootmgr
        pavucontrol
        alsa-utils
        home-manager

    ];

    fonts.fontconfig.enable = true;
  


    home = {
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
}
