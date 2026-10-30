return {
  {
    "skywind3000/asyncrun.vim",
    config = function()
      vim.g.asyncrun_open = 15
      vim.g.asyncrun_mode = "toggle"

      local function shellescape(s)
        return vim.fn.shellescape(s, 1)
      end

      local function rustc_run(file)
        local out = vim.fn.tempname()
        return string.format("rustc %s -o %s && %s", shellescape(file), shellescape(out), shellescape(out))
      end

      local function python_run(file)
        local activate = ".venv/bin/activate"
        if vim.fn.filereadable(activate) == 1 then
          return "source " .. shellescape(activate) .. " && python -u " .. shellescape(file)
        end

        return "python3 -u " .. shellescape(file)
      end

      local runners = {
        python = function()
          return python_run(vim.fn.expand("%:p"))
        end,
        go = function()
          return "go run " .. shellescape(vim.fn.expand("%:p"))
        end,
        rust = function()
          return rustc_run(vim.fn.expand("%:p"))
        end,
        lua = function()
          return "lua " .. shellescape(vim.fn.expand("%:p"))
        end,
        sh = function()
          return "bash " .. shellescape(vim.fn.expand("%:p"))
        end,
        bash = function()
          return "bash " .. shellescape(vim.fn.expand("%:p"))
        end,
        zsh = function()
          return "zsh " .. shellescape(vim.fn.expand("%:p"))
        end,
      }

      local function async_run(cmd, mode)
        if mode then
          vim.cmd("AsyncRun -mode=" .. mode .. " " .. cmd)
        else
          vim.cmd("AsyncRun " .. cmd)
        end
      end

      local function run_file(opts)
        opts = opts or {}
        if vim.fn.expand("%") == "" or vim.bo.buftype ~= "" then
          vim.notify("実行できるファイルがありません", vim.log.levels.WARN)
          return
        end

        local runner = runners[vim.bo.filetype]
        if not runner then
          vim.notify("未対応の filetype: " .. vim.bo.filetype, vim.log.levels.WARN)
          return
        end

        vim.cmd("write")
        local cmd = runner()
        if not cmd then
          return
        end

        async_run(cmd, opts.mode)
      end

      local function run_visual(opts)
        opts = opts or {}
        local ft = vim.bo.filetype
        if ft ~= "python" and ft ~= "lua" then
          vim.notify("選択範囲の実行は python / lua のみ対応です", vim.log.levels.WARN)
          return
        end

        local lines = vim.fn.getline("'<", "'>")
        if #lines == 0 then
          return
        end

        local ext = ft == "python" and ".py" or ".lua"
        local tmp = vim.fn.tempname() .. ext
        vim.fn.writefile(lines, tmp)

        local cmd = ft == "python" and python_run(tmp) or ("lua " .. shellescape(tmp))
        async_run(cmd, opts.mode)
      end

      vim.keymap.set("n", "<leader>cx", function()
        run_file()
      end, { desc = "Run file (quickfix)" })

      vim.keymap.set("n", "<leader>cX", function()
        run_file({ mode = "float" })
      end, { desc = "Run file (terminal)" })

      vim.keymap.set("n", "<F5>", function()
        run_file()
      end, { desc = "Run file" })

      vim.keymap.set("v", "<leader>cx", function()
        run_visual()
      end, { desc = "Run selection (quickfix)" })

      vim.keymap.set("v", "<leader>cX", function()
        run_visual({ mode = "float" })
      end, { desc = "Run selection (terminal)" })

      vim.keymap.set("n", "<leader>cs", "<cmd>AsyncStop<cr>", { desc = "Stop async run" })
    end,
  },
}
