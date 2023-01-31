local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier.with({
      condition = function(utils)
        return utils.has_file { ".prettierrc", ".prettierrc.js" }
      end,
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslint_configured }),
    null_ls.builtins.formatting.eslint_d.with({ condition = has_eslint_configured }),
    null_ls.builtins.diagnostics.fish
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.format() end
      })
    end
  end,
}
