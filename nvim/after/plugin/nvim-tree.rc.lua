-- local status_ok, nvim_tree = pcall(require, 'nvim-tree')
local status_ok = pcall(require, 'nvim-tree')
if not status_ok then
	return
end

-- local lib = require("nvim-tree.lib")

local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback


-- To see all the supported commands, press g? to toggle the help.

-- Explorer
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFile<CR>')

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<leader>e", action = "close" },
        { key = "u", action = "dir_up" },
        { key = 'v', cb = tree_cb('vsplit') },
        { key = 's', cb = tree_cb('split') },
      },
    },
  },
  renderer = {
    add_trailing = false,
		group_empty = false,
		highlight_git = false,
		highlight_opened_files = 'none',
		root_folder_modifier = ':t',
    indent_markers = {
			enable = true,
			icons = {
				corner = '└ ',
				edge = '│ ',
				none = '  ',
			},
		},
    icons = {
			webdev_colors = true,
			git_placement = 'before',
			padding = ' ',
			symlink_arrow = ' ➛ ',
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = '',
				symlink = '',
				folder = {
          arrow_open = '▾',
					arrow_closed = '▸',
					default = '',
					empty = '',
					empty_open = '',
					open = '',
					symlink = '',
					symlink_open = '',
				},
				git = {
					deleted = '',
					ignored = '',
					renamed = '',
					staged = '',
					unmerged = '',
					unstaged = '',
					untracked = 'ﲉ',
				},
			},
		},
  },
  filters = {
    dotfiles = true,
		custom = { '.git' },
		exclude = { '.gitignore', 'node_modules', '.cache', '.bin' },
  },
  git = {
    enable = true,
		ignore = true,
	},
  diagnostics = {
		enable = true,
		icons = {
			hint = '',
			info = '',
			warning = '',
			error = '',
		},
	},
  update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
})
