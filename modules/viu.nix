{ pkgs, ... }:

{
  home.packages = with pkgs; [ 
    mpv
    fzf
    chafa
    ffmpeg
  ];

  xdg.configFile."viu/config.toml".text = ''
    # ==============================================================================
    # VIU CONFIGURATION (Managed by Nix Home Manager)
    # ==============================================================================

    [general]
    desktop_notification_duration = 300
    preferred_tracker = "local"
    pygment_style = "gruvbox-light"
    preferred_spinner = "smiley"
    media_api = "anilist"
    welcome_screen = false
    provider = "allanime"
    selector = "fzf"
    auto_select_anime_result = true
    icons = true
    preview = "full"
    preview_scale_up = false
    image_renderer = "icat"
    manga_viewer = "feh"
    check_for_updates = true
    show_new_release = true
    update_check_interval = 12.0
    cache_requests = true
    max_cache_lifetime = "03:00:00"
    normalize_titles = true
    discord = false
    recent = 50

    [stream]
    player = "mpv"
    quality = "1080"
    translation_type = "sub"
    server = "TOP"
    auto_next = false
    continue_from_watch_history = true
    preferred_watch_history = "local"
    auto_skip = true
    episode_complete_at = 80
    ytdlp_format = "best[height<=1080]/bestvideo[height<=1080]+bestaudio/best"
    force_forward_tracking = true
    default_media_list_tracking = "prompt"
    sub_lang = "eng"
    use_ipc = true

    [downloads]
    downloader = "auto"
    # Note: You might want to change this to /home/youruser/Videos... 
    # or use config.home.homeDirectory if you want it portable.
    downloads_dir = "/home/yahya/Videos/viu"
    enable_tracking = true
    max_concurrent_downloads = 3
    max_retry_attempts = 2
    retry_delay = 60
    merge_subtitles = true
    cleanup_after_merge = true
    server = "TOP"
    ytdlp_format = "best[height<=1080]/bestvideo[height<=1080]+bestaudio/best"
    no_check_certificate = true

    [anilist]
    per_page = 15
    sort_by = "SEARCH_MATCH"
    media_list_sort_by = "MEDIA_POPULARITY_DESC"
    preferred_language = "english"

    [jikan]
    per_page = 15
    sort_by = "SEARCH_MATCH"
    media_list_sort_by = "MEDIA_POPULARITY_DESC"
    preferred_language = "english"

    [fzf]
    header_color = "95,135,175"
    preview_header_color = "215,0,95"
    preview_separator_color = "208,208,208"

    header_ascii_art = """
    ██╗░░░██╗██╗██╗░░░██╗
    ██║░░░██║██║██║░░░██║
    ╚██╗░██╔╝██║██║░░░██║
    ░╚████╔╝░██║██║░░░██║
    ░░╚██╔╝░░██║╚██████╔╝
    ░░░╚═╝░░░╚═╝░╚═════╝░
    """

    opts = """
    --color=fg:#d0d0d0,fg+:#d0d0d0,bg:-1,bg+:#262626
    --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
    --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
    --color=border:-1,label:#aeaeae,query:#d9d9d9
    --border=none
    --border-label=""
    --prompt=">"
    --marker=">"
    --pointer="◆"
    --separator="─"
    --scrollbar="│"
    --layout=reverse
    --cycle
    --info=hidden
    --height=100%
    --bind=right:accept,ctrl-/:toggle-preview,ctrl-space:toggle-wrap+toggle-preview-wrap
    --no-margin
    +m
    -i
    --exact
    --tabstop=1
    --preview-window=noborder,left,35%,wrap
    --wrap
    """

    [rofi]
    # WARNING: /usr/lib paths do not exist on NixOS.
    # Viu usually defaults to internal assets if these are removed.
    # If you need custom themes, copy the .rasi files to ~/.config/rofi and point there.
    # theme_main = "/usr/lib/python3.13/site-packages/viu_media/assets/defaults/rofi-themes/main.rasi"
    # theme_preview = "/usr/lib/python3.13/site-packages/viu_media/assets/defaults/rofi-themes/preview.rasi"
    # theme_confirm = "/usr/lib/python3.13/site-packages/viu_media/assets/defaults/rofi-themes/confirm.rasi"
    # theme_input = "/usr/lib/python3.13/site-packages/viu_media/assets/defaults/rofi-themes/input.rasi"

    [mpv]
    args = ""
    pre_args = ""

    [vlc]
    args = ""

    [media_registry]
    media_dir = "/home/yahya/Videos/viu/.registry"
    index_dir = "/home/yahya/.config/viu"

    [sessions]
    dir = "/home/yahya/.config/viu/.sessions"

    [worker]
    enabled = true
    notification_check_interval = 15
    download_check_interval = 5
    download_check_failed_interval = 60
    auto_download_new_episode = true
  '';
}
