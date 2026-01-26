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
