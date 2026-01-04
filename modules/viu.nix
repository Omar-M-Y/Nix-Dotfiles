{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [ 
    mpv
    fzf
    chafa
    ffmpeg
  ];

  # REMOVE the previous "xdg.configFile" block entirely.
  # We use this activation script instead:
  
  home.activation.configureViu = lib.hm.dag.entryAfter ["writeBoundary"] ''
    # 1. Set the path
    CONFIG_DIR="${config.xdg.configHome}/viu"
    CONFIG_FILE="$CONFIG_DIR/config.ini"

    # 2. Ensure directory exists
    if [ ! -d "$CONFIG_DIR" ]; then
      mkdir -p "$CONFIG_DIR"
    fi

    # 3. Create the config content using a temporary Nix file
    # We 'cat' it into place so it becomes a real file, not a symlink
    cat ${pkgs.writeText "viu-config" ''
      [general]
      provider = allanime
      selector = fzf
      preview = full
      image_renderer = chafa
      icons = True
      
      [stream]
      player = mpv
      quality = 1080
      translation_type = sub
      use_ipc = True
      auto_next = False
      
      [downloads]
      downloader = auto
      merge_subtitles = True
      
      [worker]
      enabled = True
    ''} > "$CONFIG_FILE"

    # 4. CRITICAL: Grant write permissions so Viu can open it
    chmod 644 "$CONFIG_FILE"
  '';
}
