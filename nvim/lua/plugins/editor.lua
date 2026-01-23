return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "tpope/vim-fugitive",
    config = function()
      --vim-fugitive
      vim.keymap.set("n", "<leader>gs", ":Git<CR>", { noremap = true, desc = "git status" }) --git status
      vim.keymap.set("n", "<leader>ga", ":Git add ", { noremap = true, desc = "git add " })
      vim.keymap.set("n", "<leader>gA", ":Git add .<CR>", { noremap = true, desc = "git add ." })
      vim.keymap.set("n", "<leader>gF", ":Git fetch -p<CR>", { noremap = true, desc = "git fetch -p" })
      vim.keymap.set("n", "<leader>gp", ":Git push --quiet <CR>", { noremap = true, desc = "git push" })
      vim.keymap.set("n", "<leader>gc", ':Git commit -qam "', { noremap = true, desc = "git commit -am" })
    end,
  },
  -- Godot support
  {
    "habamax/vim-godot",
    config = function()
      -- Godot breakpoint commands
      local godot_project_path = vim.fn.getcwd()
      if
        vim.uv.fs_stat(godot_project_path .. "/project.godot")
        or vim.uv.fs_stat(godot_project_path .. "/../project.godot")
      then
        vim.api.nvim_create_user_command("GodotBreakpoint", function()
          vim.cmd("normal! obreakpoint")
          vim.cmd("write")
        end, {})
        vim.keymap.set("n", "<leader>gb", ":GodotBreakpoint<CR>", { noremap = true, desc = "Add Godot breakpoint" })

        vim.api.nvim_create_user_command("GodotDeleteBreakpoints", function()
          vim.cmd("g/breakpoint/d")
        end, {})
        vim.keymap.set(
          "n",
          "<leader>gB",
          ":GodotDeleteBreakpoints<CR>",
          { noremap = true, desc = "Delete all breakpoints" }
        )

        vim.api.nvim_create_user_command("GodotFindBreakpoints", function()
          vim.cmd(":grep breakpoint | copen")
        end, {})
        vim.keymap.set(
          "n",
          "<leader>gf",
          ":GodotFindBreakpoints<CR>",
          { noremap = true, desc = "Find all breakpoints" }
        )
      end
    end,
  },
  {
    "skywind3000/asyncrun.vim",
  },
  {
    "teatek/gdscript-extended-lsp.nvim",
    opts = { view_type = "floating", picker = "snacks" },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = false,
            exclude = {
              "*.uid",
              "server.pipe",
            },
          },
        },
      },
    },
  },
  {
    "ojroques/vim-oscyank",
    config = function()
      vim.g.oscyank_term = "default"
      vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator", { noremap = true })
      vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual", { noremap = true })
    end,
  },
}
