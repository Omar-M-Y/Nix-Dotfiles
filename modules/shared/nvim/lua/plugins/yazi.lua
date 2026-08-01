-- In your plugins/yazi.lua (or wherever you configure plugins)
return {
  "mikavilpas/yazi.nvim",
  keys = {
    -- Upload standard NeoTree binding to open Yazi instead
    {
      "<leader>e",
      "<cmd>Yazi<cr>",
      desc = "Open Yazi File Manager",
    },
    -- Try binding Alt + v explicitly here to test
  },
  opts = {
    open_for_directories = true,
    -- yazi_floating_window_border = "none",
    keymaps = {
      show_help = "<f1>",
    },
  },
}
