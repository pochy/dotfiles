local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  ui = {
    border = 'single',
  },
  symbol_in_winbar = {
    enable = true,
  },
  lightbulb = {
    enable = false,
    sign = false,
    virtual_text = true,
  },
  -- outline = {
  --   win_width = 50,
  --   auto_preview = false,
  -- },
}
-- require("lspsaga").setup({
--   border_style = "single",
--   symbol_in_winbar = {
--     enable = false,
--   },
--   code_action_lightbulb = {
--     enable = false,
--   },
--   show_outline = {
--     win_width = 50,
--     auto_preview = false,
--   },
-- })

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-k>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', ';a', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<A-d>', '<cmd>Lspsaga term_toggle', opts)
