local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})

lspconfig.setup {
  ensure_installed = { "sumneko_lua", "tsserver", "eslint_d", "eslint-lsp", "emmet_ls", "prettier", "prettierd", "css_lsp" },
}
