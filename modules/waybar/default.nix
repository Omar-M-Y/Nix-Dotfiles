{ ... }: {
    programs = {
        waybar = {
            enable = true;
            settings = import ./config.nix;
            style = builtsins.readFile ./style.css;
          };
      };
  }
