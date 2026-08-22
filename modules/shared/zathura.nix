{ pkgs, lib,  ... }: {
  programs = {
    zathura = lib.mkIf (!pkgs.stdenv.isDarwin) {
      enable = true;
      package = pkgs.zathura;

      options = {
        pages-per-row = 2;
        first-page-column = "1:2";
        scroll-step = 40;
        scroll-full-overlap = "0.01";
        incremental-search = true;
        selection-clipboard = "clipboard";
        adjust-open = "best-fit";
        default-bg = "rgba(0,0,0,0)";
        recolor-lightcolor = "rgba(0,0,0,0)";
        recolor-darkcolor = "#FFFFFF";
        scrollbar-bg = "rgba(0,0,0,0)";
        scrollbar-fg = "#FFFFFF";
        statusbar-bg = "rgba(0,0,0,0.5)";
        statusbar-fg = "#FFFFFF";
        statusbar-home-tilde = true;
        guioptions = "csv";
      };

      mappings = {
        "<C-Button4>" = "zoom in";
        "<C-Button5>" = "zoom out";
      };
    };
  };
}
