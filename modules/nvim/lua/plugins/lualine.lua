return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- 1. DISABLE global separators
    -- This removes the stray "white curved part" in the middle of the screen.
    opts.options.section_separators = ""
    opts.options.component_separators = ""
    opts.options.globalstatus = true

    -- 2. Define Transparency (Same as before)
    local function make_transparent(mode)
      if mode.b then
        mode.b.bg = "NONE"
      end
      if mode.c then
        mode.c.bg = "NONE"
      end
      if mode.x then
        mode.x.bg = "NONE"
      end
      if mode.y then
        mode.y.bg = "NONE"
      end
    end

    local theme = require("lualine.themes.tokyonight")
    for _, mode in pairs(theme) do
      make_transparent(mode)
    end
    opts.options.theme = theme

    -- 3. Manually add curves ONLY to the edges
    opts.sections = {
      -- Left Pill: Add the curve explicitly here
      lualine_a = {
        { "mode", separator = { left = "", right = "" }, right_padding = 2 },
      },

      -- Middle: Clean text, NO extra curves
      lualine_b = { "filename", "branch" },
      lualine_c = { "fileformat" },
      lualine_x = {},
      lualine_y = { "filetype", "progress" },

      -- Right Pill: Add the curve explicitly here
      lualine_z = {
        { "location", separator = { left = "", right = "" }, left_padding = 2 },
      },
    }
  end,
}
