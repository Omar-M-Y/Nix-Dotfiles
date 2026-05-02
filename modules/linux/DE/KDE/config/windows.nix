{ ... }: {
  programs.plasma.configFile."kwinrc"."EdgeBarrier" = {
    "EdgeBarrier" = 10;
    "CornerBarrier" = false;
  };

  programs.plasma.configFile."kwinrc"."Windows" = {
    "ElectricBorderSnap" = false;
    "WindowSnapZone" = 0;
  };

  # programs.plasma.workspace.wallpaperPlugin = "com.github.catsout.wallpaperEngineKde";
}
