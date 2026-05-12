-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.wrap = true

-- ヤンク/プットをシステムクリップボードと連携（マウス選択後のコピーや他アプリとの貼り付けに必要）
opt.clipboard = "unnamedplus"
