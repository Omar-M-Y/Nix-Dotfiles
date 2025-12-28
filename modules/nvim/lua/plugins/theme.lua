return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      integrations = {
        neotree = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
      -- 👇 ADD THIS SECTION TO REMOVE THE GRAY BORDER
      custom_highlights = function(colors)
        return {
          -- "NormalFloat" is the background of the window. Make it transparent.
          NormalFloat = { bg = colors.none },
          -- "FloatBorder" is the line around the window.
          -- Set bg to none (transparent) and fg to blue (or any color you like)
          FloatBorder = { bg = colors.none, fg = colors.blue },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
