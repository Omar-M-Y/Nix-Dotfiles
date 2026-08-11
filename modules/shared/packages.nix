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
  };
}
