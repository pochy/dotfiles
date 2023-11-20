return {
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        gruvbox_material_background = "soft",
        gruvbox_material_better_performance = 1,
      }
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
