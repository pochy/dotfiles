-- Neogit: Magit-style Git interface for Neovim
-- https://github.com/NeogitOrg/neogit
return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional: Diff integration
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit (Git status)" },
  },
  opts = {
    kind = "tab",
    disable_hint = false,
    disable_signs = false,
    use_default_keymaps = true,
    commit_editor = {
      kind = "tab",
      show_staged_diff = true,
    },
    integrations = {
      telescope = true, -- LazyVim has telescope
      diffview = true,
    },
  },
}
