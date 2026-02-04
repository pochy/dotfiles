-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jj", "<Esc>", opts)

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Toggle diagnostics (lint) for current buffer
keymap.set("n", "<leader>ct", function()
  local bufnr = vim.api.nvim_get_current_buf()
  -- Check if diagnostics are currently disabled for this buffer
  local disabled = vim.diagnostic.is_disabled(bufnr)
  if disabled then
    vim.diagnostic.enable(bufnr)
    vim.notify("Diagnostics enabled", vim.log.levels.INFO)
  else
    vim.diagnostic.disable(bufnr)
    vim.notify("Diagnostics disabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle diagnostics (lint)" })

-- Disable diagnostics for markdown files in current buffer (apply immediately)
keymap.set("n", "<leader>cta", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  if filetype == "markdown" then
    vim.diagnostic.disable(bufnr)
    vim.notify("Markdown diagnostics disabled for this buffer", vim.log.levels.INFO)
  else
    vim.notify("This is not a markdown file", vim.log.levels.WARN)
  end
end, { desc = "Disable markdown diagnostics (apply now)" })

-- Apply markdown lint disable to all open markdown buffers
vim.api.nvim_create_user_command("DisableMarkdownLint", function()
  local count = 0
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].filetype == "markdown" then
      vim.diagnostic.disable(bufnr)
      count = count + 1
    end
  end
  if count > 0 then
    vim.notify(string.format("Disabled diagnostics for %d markdown buffer(s)", count), vim.log.levels.INFO)
  else
    vim.notify("No markdown buffers found", vim.log.levels.WARN)
  end
end, { desc = "Disable lint for all open markdown buffers" })

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- ビジュアル選択後 Esc で抜けるときにクリップボードへ自動コピー（マウス選択→Esc で他アプリに貼り付け可能）
vim.keymap.set("x", "<Esc>", '"+y<Esc>', { noremap = true, desc = "Yank selection to clipboard and leave visual mode" })

-- Config reload (LiveReload): Neovim 再起動なしで設定を反映
vim.api.nvim_create_user_command("ConfigReload", function(opts)
  local name = opts.args and opts.args ~= "" and opts.args or nil
  local buf_path = vim.api.nvim_buf_get_name(0)
  local ft = vim.bo.ft

  -- 引数でプラグイン名が指定された場合
  if name then
    require("lazy").reload({ plugins = { name }, wait = true, show = false })
    vim.notify("Reloaded: " .. name, vim.log.levels.INFO)
    return
  end

  -- 現在のバッファが lua/plugins/*.lua の場合、ファイル名からプラグイン名を推測
  if buf_path:match("lua/plugins/[^/]+%.lua$") then
    local fname = buf_path:match("lua/plugins/([^/]+)%.lua$")
    local plugin_name = fname:gsub("%-", ".")
    require("lazy").reload({ plugins = { plugin_name }, wait = true, show = false })
    vim.notify("Reloaded plugin: " .. plugin_name, vim.log.levels.INFO)
    return
  end

  -- 現在のバッファが lua/config/*.lua の場合、そのモジュールを再読み込み
  local config_match = buf_path:match("lua/config/([^/]+)%.lua$")
  if config_match then
    local mod = "config." .. config_match
    package.loaded[mod] = nil
    require(mod)
    vim.notify("Reloaded config: " .. mod, vim.log.levels.INFO)
    return
  end

  vim.notify(
    "ConfigReload: プラグイン名を指定するか、lua/plugins/*.lua または lua/config/*.lua を開いた状態で実行してください。例: ConfigReload blink.cmp",
    vim.log.levels.INFO
  )
end, {
  desc = "Reload config or plugin without restart (LiveReload)",
  nargs = "?",
})

vim.keymap.set("n", "<leader>cR", "<cmd>ConfigReload<CR>", { desc = "Config reload (LiveReload)" })
