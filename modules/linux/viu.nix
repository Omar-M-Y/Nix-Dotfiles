{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [ 
    mpv
    fzf
    chafa
    ffmpeg
    python3
    yt-dlp
(pkgs.writeShellScriptBin "viu" ''
  chmod -R u+w ~/.cache/viu 2>/dev/null || true
  (while sleep 2; do chmod -R u+w ~/.cache/viu 2>/dev/null; done) &
  CHMOD_PID=$!
  ${inputs.viu.packages.${pkgs.system}.default}/bin/viu "$@"
  EXIT_CODE=$?
  kill $CHMOD_PID 2>/dev/null
  exit $EXIT_CODE
'')
  ];

  xdg.configFile."viu/config.toml".text = ''
    [general]
    desktop_notification_duration = 300
    preferred_tracker = "local"
    pygment_style = "github-dark"
    preferred_spinner = "smiley"
    media_api = "anilist"
    welcome_screen = true
    provider = "allanime"
    selector = "fzf"
    auto_select_anime_result = true
    icons = true
    preview = "full"
    preview_scale_up = false
    image_renderer = "icat"
    manga_viewer = "feh"
    check_for_updates = false 
    show_new_release = true
    update_check_interval = 12.0
    cache_requests = false
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
    auto_skip = false
    episode_complete_at = 80
    ytdlp_format = "best[height<=1080]/bestvideo[height<=1080]+bestaudio/best"
    force_forward_tracking = true
    default_media_list_tracking = "prompt"
    sub_lang = "eng"
    use_ipc = true

    [downloads]
    downloader = "auto"
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
    theme_main = "/nix/store/ypsb9gjdcv823s050piy8s09r2n8i6l8-viu-3.1.0/lib/python3.12/site-packages/viu_media/assets/defaults/rofi-themes/main.rasi"
    theme_preview = "/nix/store/ypsb9gjdcv823s050piy8s09r2n8i6l8-viu-3.1.0/lib/python3.12/site-packages/viu_media/assets/defaults/rofi-themes/preview.rasi"
    theme_confirm = "/nix/store/ypsb9gjdcv823s050piy8s09r2n8i6l8-viu-3.1.0/lib/python3.12/site-packages/viu_media/assets/defaults/rofi-themes/confirm.rasi"
    theme_input = "/nix/store/ypsb9gjdcv823s050piy8s09r2n8i6l8-viu-3.1.0/lib/python3.12/site-packages/viu_media/assets/defaults/rofi-themes/input.rasi"

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
