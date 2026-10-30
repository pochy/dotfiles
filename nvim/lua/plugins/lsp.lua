return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.g.lsp_enabled = false

      opts.setup = opts.setup or {}
      local default_setup = opts.setup["*"]
      opts.setup["*"] = function(server, server_opts)
        if default_setup and default_setup(server, server_opts) then
          return true
        end

        vim.lsp.config(server, server_opts)
        return true
      end

      local function matching_servers(bufnr)
        local filetype = vim.bo[bufnr].filetype
        local servers = {}

        for name, _ in pairs(vim.lsp.config._configs or {}) do
          local config = vim.lsp.config[name]
          local filetypes = config and config.filetypes
          if filetypes and vim.tbl_contains(filetypes, filetype) then
            servers[#servers + 1] = name
          end
        end

        table.sort(servers)
        return servers
      end

      local function start_lsp(bufnr)
        local started = 0

        for _, server in ipairs(matching_servers(bufnr)) do
          local config = vim.deepcopy(vim.lsp.config[server])
          config.name = config.name or server
          config.enabled = nil
          config.keys = nil
          config.mason = nil

          if vim.lsp.start(config, { bufnr = bufnr, silent = true }) then
            started = started + 1
          end
        end

        vim.b[bufnr].lsp_enabled = started > 0
        if started > 0 then
          vim.notify(string.format("LSP: ON (%d server%s)", started, started == 1 and "" or "s"), vim.log.levels.INFO)
        else
          vim.notify("LSP: このバッファに対応するサーバーがありません", vim.log.levels.WARN)
        end
      end

      local function stop_lsp(bufnr)
        local clients = vim.lsp.get_clients({ bufnr = bufnr })

        for _, client in ipairs(clients) do
          vim.lsp.buf_detach_client(bufnr, client.id)

          vim.schedule(function()
            if vim.tbl_isempty(client.attached_buffers or {}) then
              client:stop()
            end
          end)
        end

        vim.b[bufnr].lsp_enabled = false
        vim.notify(string.format("LSP: OFF (%d client%s)", #clients, #clients == 1 and "" or "s"), vim.log.levels.INFO)
      end

      local function toggle_lsp()
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })

        if vim.b[bufnr].lsp_enabled or #clients > 0 then
          stop_lsp(bufnr)
        else
          start_lsp(bufnr)
        end
      end

      vim.keymap.set("n", "<leader>ul", toggle_lsp, { desc = "Toggle LSP for current buffer" })

      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        gdscript = {
          cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
          filetypes = { "gd", "gdscript", "gdscript3" },
          root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
        },
      })

      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gdscript", "godot_resource", "gdshader" })
      end
    end,
  },
}
