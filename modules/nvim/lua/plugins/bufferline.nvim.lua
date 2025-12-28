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
      -- 1. Remove Separators (Set them to empty strings)
      separator_style = { "", "" },

      -- 2. Keep your numbers and icons
      show_buffer_icons = true,
      always_show_bufferline = true,

      -- 3. Minimal Indicator (the line under the active tab)
      -- Change to "none" if you want absolutely no lines
      indicator = {
        style = "none",
      },

      -- Add a little padding so the text isn't glued together
      buffer_close_icon = " ",
      modified_icon = "●",
      close_icon = " ",
      left_trunc_marker = "",
      right_trunc_marker = "",

      -- Enforce spacing
      padding = 1,
    },

    -- 4. Full Transparency
    highlights = function(config, render)
      local transparent = { bg = "NONE" }
      local transparent_text = { bg = "NONE" } -- Only bg transparent, keep text visible

      return {
        fill = transparent,
        background = transparent,

        -- Make separators invisible/transparent
        separator = transparent,
        separator_selected = transparent,
        separator_visible = transparent,

        -- Tab Content
        buffer_visible = transparent,
        buffer_selected = { bg = "NONE", bold = true, italic = true },

        -- Numbers
        numbers = transparent,
        numbers_visible = transparent,
        numbers_selected = { bg = "NONE", bold = true },
      }
    end,
  },
}
