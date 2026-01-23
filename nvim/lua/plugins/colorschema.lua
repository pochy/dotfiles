return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "frappe",
      },
      transparent_background = true, -- disables setting the background color.
      float = {
        transparent = true, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
    },
  },
  -- {
  --   "eddyekofo94/gruvbox-flat.nvim",
  --   priority = 1000,
  --   enabled = true,
  --   opts = function()
  --     -- vim.cmd([[colorscheme gruvbox-flat]])
  --     return {
  --       gruvbox_transparent = true,
  --     }
  --   end,
  -- },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    config = function()
      vim.print("setup gruvbox-material")
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 2
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "gruvbox-flat",
      -- colorscheme = "gruvbox-material",
      -- colorscheme = "tokyonight",
    },
  },
}
