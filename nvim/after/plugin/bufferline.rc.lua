local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local colors = {
  fg1    = '#282828',
  color2 = '#504945',
  fg2    = '#ddc7a1',
  color3 = '#32302f',
  color4 = '#a89984',
  color5 = '#7daea3',
  color6 = '#a9b665',
  color7 = '#d8a657',
  color8 = '#d3869b',
  color9 = '#ea6962',
}

bufferline.setup({
  options = {
    --[[ mode = "tabs", ]]
    separator_style = 'padded_slant',
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,
    diagnostics = 'nvim_lsp',
    --[[ indicator_icon = "▎", ]]
    indicator_icon = nil,
    indicator = { style = "icon", icon = "▎" },
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
    --[[ show_buffer_icons = true, ]]
    show_buffer_close_icons = false,
    show_close_icon = false,
    --[[ show_tab_indicators = true, ]]
    --[[ persist_buffer_sort = true, ]]
    color_icons = true
  },
  highlights = {
    separator = {
      fg = colors.fg1,
      bg = colors.color3,
    },
    separator_selected = {
      fg = colors.fg1,
      bg = colors.color2,
    },
    background = {
      fg = colors.color2,
      bg = colors.color3,
    },
    buffer_selected = {
      fg = colors.fg2,
      bg = colors.color2,
      bold = true,
    },
    fill = {
      bg = colors.fg1
    }
  },
})

--[[ vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {}) ]]
--[[ vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {}) ]]
-- vim.keymap.set('n', '<Tab>', 'gt', {})
-- vim.keymap.set('n', '<S-Tab>', 'gT', {})
