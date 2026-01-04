{ pkgs, ... }: {

{
  # 1. Ensure the external tools Viu needs are installed
  #    (You can remove these if they are already in home.nix)
  home.packages = with pkgs; [ 
    mpv           # Required for streaming
    fzf           # Recommended TUI selector
    chafa         # Recommended for image previews
    ffmpeg        # Required for downloading/merging
  ];

  # 2. Define the configuration file declaratively
  xdg.configFile."viu/config.ini".text = ''
    [general]
    # Providers: allanime, animepahe, gogoanime, zoro
    provider = allanime
    # Selectors: fzf, rofi, default
    selector = fzf
    # Preview: full, text, image, none
    preview = full
    # Image Renderer: icat (for kitty), chafa (universal)
    image_renderer = chafa
    icons = True
    auto_select_anime_result = True

    [stream]
    player = mpv
    # Quality: 1080, 720, 480, 360
    quality = 1080
    # Type: sub, dub
    translation_type = sub
    # MPV IPC allows keybindings like Shift+N (Next Ep)
    use_ipc = True
    auto_next = False
    continue_from_watch_history = True

    [downloads]
    downloader = auto
    # Tip: Set this to a specific path if you don't want it in the current dir
    # downloads_dir = ~/Videos/Anime 
    max_concurrent_downloads = 3
    merge_subtitles = True
    cleanup_after_merge = True

    [worker]
    enabled = True
    notification_check_interval = 15
    download_check_interval = 5
  '';
}
