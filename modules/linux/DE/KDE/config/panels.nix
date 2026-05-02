# home/plasma/panels.nix
{ ... }:

{
  programs.plasma.panels = [
    {
      location = "bottom";
      height = 44; # Standard height for Plasma 6
      screen = 0;
      widgets = [
        # "luisbocanegra.panel.colorizer"
        "org.kde.plasma.kickoff"          # Application Launcher
        "org.kde.plasma.pager"            # Desktop Switcher
        "org.kde.plasma.icontasks"        # Icons-only Task Manager
        "org.kde.plasma.marginsseparator" # Spacer to push items right
        "org.kde.plasma.systemtray"       # Status icons/Notifications
        "org.kde.plasma.digitalclock"     # Clock and Calendar
      ];
    }
  ];
}
