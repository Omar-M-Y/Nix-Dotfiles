{ ... }: {
  nix = {
      settings = {
          experimental-features = [ "nix-command" "flakes" ];
          substituters = [ "https://attic.xuyh0120.win/lantian" ];
          trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
          auto-optimise-store = true;
        };
      gc = {
          automatic = true;
          dates = "weekly";
          options = "--delete-older-than 7d";
        };
    };
}
