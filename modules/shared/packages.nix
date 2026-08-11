{ pkgs, ... }: {
  home = {
    packages = with pkgs; [
      gcc
      gnumake
      unzip
      wget
      curl
      ripgrep
      fd
      git
      fzf

      # Lua - Mainly for Neovim
      lua-language-server
      nil
      nixpkgs-fmt
      stylua
      typescript-language-server

      # Commented out for VM
      home-manager
      discord
      uv
      yazi
      #        notion-app
      # btop
      vscode
      ruff
      R
      rPackages.languageserver

      prismlauncher

      # wezterm
      #
    ];
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "Omar-M-Y";
        user.email = "yahya.omar_@outlook.com";
        init.defaultBranch = "main";
        credential.helper = "store";
      };
    };
    fish = {
      enable = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;  
    };
    zathura = {
      enable = true;
      package = pkgs.zathura;

      options = {
        scroll-step = 40;
        scroll-full-overlap = "0.01";
        incremental-search = true;
        selection-clipboard = "clipboard";
        adjust-open = "best-fit";
        default-bg = "rgba(0,0,0,0)";
        recolor-lightcolor = "rgba(0,0,0,0)";
        recolor-darkcolor = "#FFFFFF";
        scrollbar-bg = "rgba(0,0,0,0)";
        scrollbar-fg = "#FFFFFF";
        statusbar-bg = "rgba(0,0,0,0.5)";
        statusbar-fg = "#FFFFFF";
        statusbar-home-tilde = true;
        guioptions = "csv";
      };

      mappings = {
        "<C-Button4>" = "zoom in";
        "<C-Button5>" = "zoom out";
      };
    };
  };
}
