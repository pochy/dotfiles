return {
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
    opts = function()
      return {
        gruvbox_material_background = "soft",
        gruvbox_material_better_performance = 1,
        gruvbox_material_transparent_background = 2,
      }
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
      -- colorscheme = "gruvbox-flat",
      colorscheme = "gruvbox-material",
      -- colorscheme = "tokyonight",
    },
  },
}
