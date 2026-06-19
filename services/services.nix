{ pkgs, inputs, ... }: {
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services = {
    udev = {
      packages = [
        pkgs.openlinkhub
      ];
      extraRules = ''
        # Corsair iCUE Commander CORE
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c1c", MODE="0660", GROUP="openlinkhub"
        # Corsair Lighting Node Pro
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="1b1c", ATTRS{idProduct}=="0c0b", MODE="0660", GROUP="openlinkhub"

        SUBSYSTEM=="usb", ATTRS{idVendor}=="1b1c", MODE="0660", GROUP="openlinkhub"
      '';
    };
    scx = {
      enable = true;
      scheduler = "scx_rusty";
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
        accelSpeed = "0";
      };
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    power-profiles-daemon.enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      #package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
      ];
      settings = {
        Wayland = {
          InputMethod = "";
        };
      };
    };
    openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
    flatpak = {
      enable = true;
      update.onActivation = true;
      remotes = [{
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }];
      packages = [
        "org.vinegarhq.Sober"
      ];
      overrides = {
        "org.vinegarhq.Sober" = {
          filesystems = {
            "xdg-data/icons" = "ro";
            "~/.icons" = "ro";
          };
          environment = {
            XCURSOR_THEME = "Bibata-Modern-Classic";
            XCURSOR_SIZE = "24";
          };
        };
      };
    };
    fstrim.enable = true;
    udisks2.enable = true;
  };
}
