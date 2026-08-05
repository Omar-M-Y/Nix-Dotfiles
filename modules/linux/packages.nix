# Linux Packages - NixOS
{ pkgs, inputs, ... }:
{

  home = {
    packages = with pkgs; [
      nerd-fonts.meslo-lg
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      easyeffects
      # pavucontrol
      alsa-utils
      efibootmgr
      # wootility
      libappindicator-gtk3
      libappindicator
      protonup-qt
      bibata-cursors
      papirus-icon-theme
      plasma-panel-colorizer
      awww
      material-symbols
      # niri


      kdePackages.dolphin
      r2modman
      heroic
      osu-lazer
      # kdePackages.kolourpaint
      drawing

      uxplay
      # lutris
      # pactl
      # inputs.viu.packages.${pkgs.system}.default
      openlinkhub

      obsidian

      # xrandr
    ];
  };

  programs = {
    firefox = {
      enable = true;
      # package = pkgs.librewolf;
      nativeMessagingHosts = [ pkgs.pywalfox-native ];
      profiles.default = {
        id = 0;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.tabs.drawInTitlebar" = true;
          "browser.tabs.inTitlebar" = 1;
        };
      };
    };
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      ];
    };
  };
}
