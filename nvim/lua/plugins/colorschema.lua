return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        snacks = true,
        telescope = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.special.bufferline").get_theme()
          end
        end,
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
      -- colorscheme = "gruvbox-flat",
      -- colorscheme = "gruvbox-material",
      colorscheme = "tokyonight",
    },
  },
}
