return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  },
  opts = {
    options = {
      -- 1. Remove Separators
      separator_style = { "", "" },

      -- 2. Icons and Visibility
      show_buffer_icons = true,
      always_show_bufferline = true,

      -- 3. Minimal Indicator
      indicator = {
        style = "none",
      },

      -- Fixed: Added missing commas and removed duplicate close_icon
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",

      -- Enforce spacing
      padding = 0,
    },

    -- 4. Full Transparency (Converted from function to table)
    highlights = {
      fill = { bg = "NONE" },
      background = { bg = "NONE" },

      -- Make separators transparent
      separator = { bg = "NONE" },
      separator_selected = { bg = "NONE" },
      separator_visible = { bg = "NONE" },

      -- Tab Content
      buffer_visible = { bg = "NONE" },
      buffer_selected = { bg = "NONE", bold = true, italic = true },

      -- Numbers
      numbers = { bg = "NONE" },
      numbers_visible = { bg = "NONE" },
      numbers_selected = { bg = "NONE", bold = true },
    },
  },
}
