# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:


{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix  # VM Hardware
#      ./modules/hyprland/default.nix
    ];
boot.loader.systemd-boot.enable = false;
  boot = {
    loader.grub.enable = true;    
    loader.grub.device = "nodev";
    loader.grub.useOSProber = true;
    loader.grub.efiSupport = true;
   loader.grub.efiInstallAsRemovable = true;
   supportedFilesystems = [ "ntfs" ];
   # loader.efi.canTouchEfiVariables = true;
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
    kernelModules = [ "ntsync" ]
    loader.timeout = 5;

    # Kernel - Cachyos
    # kernelPackages = pkgs.linuxPackages_latest;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v3;
};
 
services.scx = {
    enable = true;
    scheduler = "scx_rusty";
}; 

systemd.settings.Manager = {
	DefaultTimeoutStopSec = "10s";
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
  # In configuration.nix
  security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  # jack.enable = true;
    };
  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.yahya = {
    isNormalUser = true;
    description = "yahya";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    shell = pkgs.fish;
    packages = with pkgs; [];
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos; # Use CachyOS's tuned rules
    };

  zramSwap.enable = true;
  zramSwap.memoryPercent = 100; # CachyOS usually allocates 1:1, or you can do 50

  programs.gamemode.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    gamescopeSession.enable = true; # Enable GameScope integration
    }; 



  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
    # --- Your Original Packages ---
    vim 
    wget
    git
    firefox
    google-chrome
    vscode
    fastfetch
    kitty
    imagemagick
    yazi
    sddm-astronaut
    kdePackages.qtsvg
    kdePackages.qtmultimedia

    # --- External Flakes ---
    inputs.matugen.packages.${system}.default
    inputs.ambxst.packages.${pkgs.system}.default

    # --- Ambxst Core Dependencies (from install.sh) ---
    tmux
    fuzzel                # App launcher
    networkmanagerapplet  # WiFi icon
    blueman               # Bluetooth manager
    
    # --- Multimedia & Audio ---
    playerctl             # Media keys
    pwvucontrol           # Volume control GUI
    easyeffects           # Audio effects
    ffmpeg
    mpvpaper              # Animated wallpapers
    
    # --- System Tools & Hardware Control ---
    brightnessctl         # Keyboard/Screen brightness
    ddcutil               # Monitor I2C control
    jq                    # JSON processing
    wl-clipboard          # Copy/Paste support
    grim                  # Screenshot tool
    slurp                 # Screen region selector
    upower                # Battery/Power status
    gpu-screen-recorder   # Recording support
    
    # --- Intelligence & OCR ---
    tesseract             # Optical Character Recognition
    pipx                  # For python-based toolus

    xrandr

    mangohud
    protonup-qt
    lutris
    heroic
  ];
  fileSystems = {
      "/mnt/Backup" = {
          device = "/dev/disk/by-uuid/E85E9A215E99E898";
          fsType = "ntfs3";
          options = [ "rw" "uid=1000" "gid=100" "umask=0022" "nofail" ];
        };
      "/mnt/Work" = {
          device = "/dev/disk/by-uuid/6EFAE1F7FAE1BB89";
          fsType = "ntfs3";
          options = [ "rw" "uid=1000" "gid=100" "umask=0022" "nofail" ];
        };
        "/mnt/Games" = {
            device = "/dev/disk/by-uuid/94FA6723FA6700BA";
            fsType = "ntfs3";
            options = [ "rw" "uid=1000" "gid=100" "umask=0022" "nofail" ]; 
          };
    };

  services.power-profiles-daemon.enable = true;
  services.displayManager.sddm = {
	enable = true;	
	wayland.enable = true;
	package = pkgs.kdePackages.sddm;
	theme = "sddm-astronaut-theme";
  setupScript = ''
    ${pkgs.xorg.xrandr}/bin/xrandr \
        --output DP-3 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
        --output HDMI-A-3 --mode 1920x1080 --pos 0x0 --rotate normal --same-as DP-3
  '';
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
      bluetooth = {
          enable = true;
        };
    };

fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

services = {
    flatpak = {
        enable = true;
        update = {
            onActivation = true;
          };
        remotes = [{
            name = "flathub";
            location = "https://dl/flathub.org/repo/flathub.flatpakrepo";
          }];
          packages = [
              "org.vinegarhq.Sober"
            ];
      };
  };

nix.settings = {
  substituters = [
    "https://attic.xuyh0120.win/lantian"
  ];

  trusted-public-keys = [
    "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
  ];
};

#  nix = {
 #   gc = {
  #    automatic = true;
   #   dates = "weekly";
    #  options = "--delete-older-than 7d";
   # };
   # settings = {
   #     auto-optimise-store = true;
   #   };
 # };

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
