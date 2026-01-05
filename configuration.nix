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


boot = {
    loader = {
        systemd-boot = {
            enable = false;
          };
        grub = {
            enable = true;
            device = "nodev";
            useOSProber = true;
            efiSupport = true;
            efiInstallAsRemovable = true;
          };
        timeout = 5;
      };
    supportedFilesystems = ["ntfs"];
    plymouth = {
        enable = true;
        theme = "mac-style";
        themePackages = [pkgs.mac-style-plymouth];
      };
    consoleLogLevel = 0;
    initrd = {
        verbose = false;
      };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"

    # --- ADD THESE FOR CACHYOS PARITY ---
    "split_lock_detect=off"              # Prevent performance drops in some games
    "transparent_hugepage=always"        # Improves memory management for heavy games
    "nvidia.NVreg_UsePageAttributeTable=1" # Increases CPU-GPU bandwidth (Nvidia specific)
    ];
    kernelModules = ["ntsync"];
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-lto-x86_64-v3;

    kernel = {
        sysctl = {
          "net.core.default_qdisc" = "cake";
          "net.ipv4.tcp_congestion_control" = "bbr";

          # Memory: Force games to use ZRAM instead of freezing when RAM is full
          "vm.swappiness" = 180;             # CachyOS default (aggressive swap to ZRAM)
          "vm.watermark_boost_factor" = 0;   # Prevent latency spikes
          "vm.watermark_scale_factor" = 125;
          "vm.page-cluster" = 0;    
        };
      };
};

services = {
    scx = {
        enable = true;
        scheduler = "scx_rusty";
    };
    xserver = {
      xkb = {
        layout = "gb";
        variant = "";
      };
        videoDrivers = ["nvidia"];
    };
    pipewire = {
        enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
          };
         pulse = {
            enable = true;
          };
          extraConfig.pipewire."99-latency" = {
            "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 1024;
            "default.clock.min-quantum" = 1024;
            "default.clock.max-quantum" = 4096;
          };
      };
    };
    ananicy = {
        enable = true;
        package = pkgs.ananicy-cpp;
        rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    power-profiles-daemon = {
        enable = true;
    };
    displayManager = {
        sddm = {
            enable = true;
            xserver = {
                enable = true;
            };
            wayland = {
                enable = false;
            };
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
    };
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
  fstrim = {
      enable = true;
    };
};

zramSwap = {
    enable = true;
    memoryPercent = 100;
};

hardware = {
  wooting = {
      enable = true;
  };
  cpu = {
      intel = {
          updateMicrocode = true;
      };
  };
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

security = {
  rtkit = {
    enable = true;
  };
};

console = {
    keyMap = "uk";
};

networking = {
    hostName = "nixos";
    networkmanager = {
        enable = true;
    };
};

time = {
    timeZone = "Europe/London";
};

i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
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
  };
  
users = {
    users = {
        yahya = {
            isNormalUser = true;
            description = "yahya";
            extraGroups = ["networkmanager" "wheel" "audio" "video"];
            shell = pkgs.fish;
            packages = with pkgs; [];
          };
      };
  };

xdg = {
    portal = {
        enable = true;
        extraPortals = [pkgs.xdg-desktop-portal-hyprland];
    };
};

programs = {
    gamemode = {
        enable = true;
    };
    steam = {
        enable = true;
        remotePlay = {
            openFirewall = true;
        };
        dedicatedServer = {
            openFirewall = true;
        };
        gamescopeSession = {
            enable = true;
          };
    };
    fish = {
        enable = true;
    };
    hyprland = {
        enable = true;
        xwayland = {
            enable = true;
        };
    };
};

nix = {
    settings = {
        experimental-features = ["nix-command" "flakes"];
        substituters = ["https://attic.xuyh0120.win/lantian"];
        trusted-public-keys = ["lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="];
        auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

nixpkgs = {
    config = {
        # Allow unfree packages
        allowUnfree = true;    
      };
  };


environment = {
    pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];
    # List packages installed in system profile. To search, run:
    # # $ nix search wget
    systemPackages = with pkgs; [
    vim 
    wget
    git
    firefox
    google-chrome
    vscode
    neofetch
    speedtest-cli
    kitty
    imagemagick
    yazi
    sddm-astronaut
    kdePackages.qtsvg
    kdePackages.qtmultimedia

    # --- External Flakes ---
    inputs.matugen.packages.${system}.default
    # inputs.ambxst.packages.${pkgs.system}.default

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
  };

fileSystems = {
  "/mnt/Cachyos" = {
    device = "/dev/disk/by-uuid/aeab9848-46e9-407a-8569-6a2b918e478b";
    fsType = "btrfs";
    options = ["nofail" "subvol=@"];
  };
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
    options = [ 
    "rw"
    "uid=1000"
    "gid=100"
    "dmask=0022"
    "fmask=0022"
    "windows_names"  # Prevents creation of names Windows hates
    "nofail"
    ]; 
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
