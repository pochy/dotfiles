local status, hop = pcall(require, "hop")
if (not status) then return end
hop.setup({
  keys = 'etovxqpdygfblzhckisuran',
})
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
vim.api.nvim_set_keymap('', '<Leader>fc', "<cmd>HopChar1<cr>", {})
vim.api.nvim_set_keymap('', '<Leader>fw', "<cmd>HopWord<cr>", {})
vim.api.nvim_set_keymap('', '<Leader>fl', "<cmd>HopLine<cr>", {})

--[[ vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {}) ]]
