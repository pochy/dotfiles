local status, mason = pcall(require, "mason")
if (not status) then return end
local mason_null_ls = require('mason-null-ls')
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})

mason_null_ls.setup({
  ensure_installed = { 'prettier' },
  automatic_installation = true,
})

lspconfig.setup {
  ensure_installed = { "lua_ls", "tsserver", "eslint", "emmet_ls", "cssls" },
}