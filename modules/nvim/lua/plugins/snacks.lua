return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- 👇 Configure the explorer module specifically
    explorer = {
      enabled = true, -- You can keep it enabled if you want to use it sometimes
      replace_netrw = false, -- <--- IMPORTANT: This tells Snacks "Don't open when I run nvim ."
    },
    picker = {
      sources = {
        explorer = {
          replace_netrw = false, -- <--- Just to be safe, disable it here too
        },
      },
    },
    dashboard = { enabled = true },
  },
  keys = {
    { "<leader>e", false }, -- Your existing fix for Space+e
    { "<leader>E", false },
  },
}
