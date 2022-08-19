-- vim.o to set global options: vim.o.hidden = true
-- vim.bo to set buffer-scoped options: vim.bo.expandtab = true
-- vim.wo to set window-scoped options: vim.wo.number = true
-- global ならグローバル、local to {window|buffer} ならローカルオプションです。
-- Note: vim.opt is better than vim.o
--
-- Aliases
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local exec = vim.api.nvim_exec 	-- to execute Vimscript 
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables (global/buffer/windows-scoped)
local opt = vim.opt  -- to set options

vim.cmd("autocmd!")


vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true -- 行番号の表示


vim.opt.title = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true -- コマンド (の一部) を画面の最下行に表示する。
vim.opt.cmdheight = 1 -- コマンドラインに使われる画面上の行数。
vim.opt.laststatus = 2 -- 最下ウィンドウにいつステータス行が表示されるかを設定する。2: 常に表示
vim.opt.scrolloff = 10
-- vim.opt.shell = 'fish'
-- vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

-- Indent
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }


-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
