local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    --[[ mode = "tabs", ]]
    separator_style = 'slant',
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,
    diagnostics = 'nvim_lsp',
    indicator_icon = "▎",
    buffer_close_icon = "",
    -- buffer_close_icon = '',
    modified_icon = "●",
    close_icon = "",
    -- close_icon = '',
    left_trunc_marker = "",
    right_trunc_marker = "",
    --[[ always_show_bufferline = false, ]]
    --[[ show_buffer_close_icons = false, ]]
    --[[ show_close_icon = false, ]]
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    color_icons = true
  },
  --[[ highlights = { ]]
  --[[   separator = { ]]
  --[[     fg = '#073642', ]]
  --[[     bg = '#002b36', ]]
  --[[   }, ]]
  --[[   separator_selected = { ]]
  --[[     fg = '#073642', ]]
  --[[   }, ]]
  --[[   background = { ]]
  --[[     fg = '#657b83', ]]
  --[[     bg = '#002b36' ]]
  --[[   }, ]]
  --[[   buffer_selected = { ]]
  --[[     fg = '#fdf6e3', ]]
  --[[     bold = true, ]]
  --[[   }, ]]
  --[[   fill = { ]]
  --[[     bg = '#073642' ]]
  --[[   } ]]
  --[[ }, ]]
})

--[[ vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {}) ]]
--[[ vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {}) ]]
-- vim.keymap.set('n', '<Tab>', 'gt', {})
-- vim.keymap.set('n', '<S-Tab>', 'gT', {})
