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

      mpv
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
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      ];
    };
    firefox = {
      enable = true;
      nativeMessagingHosts = [ pkgs. pywalfox-native ];
      profiles.default = {
        id = 0;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.tabs.drawInTitlebar" = true;
          "browser.tabs.inTitlebar" = 1;
        };
      };
    };
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
    yazi = {
      settings = {
        opener = {
          comic = [
            { run = "zathura \"$@\""; desc = "Zathura"; }
          ];
        };
        open = {
          rules = [
            { mime = "application/vnd.comicbook+zip"; use = "comic"; }
            { mime = "application/vnd.comicbook-rar"; use = "comic"; }
            { name = "*.cbz"; use = "comic"; }
            { name = "*.cbr"; use = "comic"; }
            { name = "*.cb7"; use = "comic"; }
          ];
        };
      };
    };
  };
}
