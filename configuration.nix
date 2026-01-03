# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix  # VM Hardware
	    #./modules/hyprland/default.nix
    ];

  boot = {
    loader.grub.enable = true;
    loader.grub.device = "/dev/vda";
    loader.grub.useOSProber = true;
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ pkgs.mac-style-plymouth ];
    };
    
    # Silencing Boot
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    loader.timeout = 5;

    # Kernel - Cachyos
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts;
};
 
services.scx = {
    enable = true;
    scheduler = "scx_rusty";
}; 



  # Bootloader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/vda";
  #boot.loader.grub.useOSProber = true;
  

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "gb";
  #   variant = "";
  # };

  services.xserver = {
      xkb = {
          layout = "gb";
          variant = "";
        };
      videoDrivers = ["nvidia"];
    };

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yahya = {
    isNormalUser = true;
    description = "yahya";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };

  #
#let 
#  custom-astronaut = pkgs.sddm-astronaut.override {
#		embbededTheme = "pixel_sakura";
#		themeConfig = {
#			ShowAppIcon = "false";
#			FullBlur = "true";
#		};
#	};
#in
#  services.displayManager.sddm = {
#	enable = true;
#	wayland.enable = true;
#	theme = "sddm-astronaut-theme";
#	package = pkgs.kdePackages.sddm;
#	extraPackages = with pkgs; [
#		kdePackages.qtsvg
#		kdePackages.qtmultimedia
#	];
 # };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	vim 
  	wget
    git
    firefox
    google-chrome
    vscode
    fastfetch
    kitty # Terminal

    imagemagick
    yazi

    inputs.matugen.packages.${system}.default
    

  #	custom-astronaut
    sddm-astronaut
    #kdePackages.qt5compat
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    #kdePackages.qtdeclarative
  ];

  services.displayManager.sddm = {
	enable = true;	
	wayland.enable = true;
	package = pkgs.kdePackages.sddm;
	theme = "sddm-astronaut-theme";
	extraPackages = with pkgs; [
		kdePackages.qtsvg
		kdePackages.qtmultimedia
	];
   };

  programs = {
      fish = {
          enable = true;
          interactiveShellInit = ''
          starship init fish | source
          '';
      };
      hyprland = {
        enable = true;
        xwayland.enable = true;
      };
  };

  hardware = {
      graphics = {
          enable = true;
          enable32Bit = true;
        };
      nvidia = {
          modesetting.enable = true;
          open = false;
          nvidiaSettings = true;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
          powerManagement = {
              enable = false;
              finegrained = false;
            };
        };
    };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
        auto-optimise-store = true;
      };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
