{ pkgs, ... }: {

  system.primaryUser = "Yahya";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };
  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 0; Minute = 0; };
    options = "--delete-older-than 7d";
  };
  nix.optimise.automatic = true;
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 5;
  programs.fish.enable = true;
  users = {
    users = {
      yahya = {
        shell = pkgs.fish;
        home = "/Users/yahya/";
      };
    };
  };

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      tilesize = 48;
      minimize-to-application = false;
      orientation = "bottom";
    };
    finder = {
      AppleShowAllFiles = true;
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = false;
      FXPreferredViewStyle = "icnv"; # icon view (required for snap to grid)
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
    };
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticWindowAnimationsEnabled = true;
    };
    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = false;
    };
  };

  system.activationScripts.finderDefaults.text = ''
    /usr/bin/defaults write com.apple.finder FXArrangeGroupViewBy -string "Name"
    /usr/bin/defaults write com.apple.finder FXPreferredGroupBy -string "Name"
    /usr/bin/defaults write com.apple.finder FXIconViewSettings -dict arrangeBy -string "name" gridSpacing -real 54 iconSize -real 64
    /usr/bin/killall Finder || true
  '';

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      # cleanup = "zap";
    };
    brews = [
      # "mas"
    ];
    casks = [
      "microsoft-outlook"
      "arc"
      "alcove"
      "font-meslo-lg-nerd-font"
      "onedrive"
      "google-drive"
      "zoom"
      # "zen"
      "firefox"
      # "helium-browser"
      # "drivedx"
    ];
    masApps = {
      "uBlock Origin Lite" = 6745342698;
      "WhatsApp Messenger" = 310633997;
    };
  };


  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    mas
  ];


  environment.variables.SHELL = "${pkgs.fish}/bin/fish";
}
