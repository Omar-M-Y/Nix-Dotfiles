{ ... }: {
    programs.plasma.configFile."kdeglobals"."General" = {
      "TerminalApplication" = "ghostty";
      "TerminalService"     = "com.mitchellh.ghostty.desktop";
      "BrowserApplication"  = "firefox.desktop";
      "EmailClient"         = "org.kde.kmail2.desktop";
    };
  }
