require("lazy").setup({
  -- Common utilities(requre null-ls) --
  'nvim-lua/plenary.nvim',

  {
    "nvim-treesitter/nvim-treesitter",
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  -- テーマ --
  'sainnhe/gruvbox-material',
  -- ステータスライン --
  'nvim-lualine/lualine.nvim',
  'eddyekofo94/gruvbox-flat.nvim',
  -- UI --
  'norcalli/nvim-colorizer.lua',
  'folke/zen-mode.nvim',
  'akinsho/nvim-bufferline.lua', -- Tab Workspace
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  },
  -- LSP --
  'onsails/lspkind-nvim', -- vscode-like pictograms
  'neovim/nvim-lspconfig', -- LSP
  'glepnir/lspsaga.nvim', -- LSP UIs
  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },
  },

  -- LSP stuff --
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      'nvimtools/none-ls.nvim'
    },
  },
  

  -- Telescople --
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "kdheepak/lazygit.nvim",
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
      "xiyaowong/telescope-emoji.nvim"
    },
    cmd = "Telescope",
    config = function()
        require("telescope").load_extension("lazygit")
    end,
  },

  -- GIT stuff
  {
    "lewis6991/gitsigns.nvim",
  },

  -- コメント --
  "numToStr/Comment.nvim", -- Easily comment stuff
  
  -- Utils --
  
  'kylechui/nvim-surround', -- Textobject plugins
  'phaazon/hop.nvim', -- jump anyware
  'mbbill/undotree',
  'windwp/nvim-autopairs',

  -- ICON --
  "nvim-tree/nvim-web-devicons",
})

--  *  Plugin manager Pakcer

-- local fn = vim.fn

-- -- Automatically install packer
-- local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
-- if fn.empty(fn.glob(install_path)) > 0 then
--   PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--   print("Installing packer close and reopen Neovim...")
-- end

-- -- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])

-- -- Use a protected call so we don't error out on first use
-- local status_ok, packer = pcall(require, "packer")
-- if not status_ok then
--   return
-- end

-- -- Have packer use a popup window
-- packer.init({
--     display = {
--       open_fn = function()
--         return require('packer.util').float({ border = 'single' })
--       end
--     }
--   }
-- )

-- --[[ local status, packer = pcall(require, "packer") ]]
-- --[[ if (not status) then ]]
-- --[[   print("Packer is not installed") ]]
-- --[[   return ]]
-- --[[ end ]]

-- vim.cmd [[packadd packer.nvim]]

-- return packer.startup(function(use)
--   use 'wbthomason/packer.nvim'
--   use 'sainnhe/gruvbox-material'
--   use 'eddyekofo94/gruvbox-flat.nvim'
--   use 'nvim-lua/plenary.nvim' -- Common utilities(requre null-ls)
--   use 'nvim-lualine/lualine.nvim' -- Statusline
--   use 'onsails/lspkind-nvim' -- vscode-like pictograms
--   use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
--   use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
--   use 'hrsh7th/nvim-cmp' -- Completion
--   use 'neovim/nvim-lspconfig' -- LSP
--   use 'creativenull/diagnosticls-configs-nvim'
--   use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
--   -- use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
--   use 'williamboman/mason.nvim'
--   use 'williamboman/mason-lspconfig.nvim'
--   use "numToStr/Comment.nvim" -- Easily comment stuff

--   use 'glepnir/lspsaga.nvim' -- LSP UIs
--   use 'L3MON4D3/LuaSnip' -- Snippet

--   use {
--     'nvim-treesitter/nvim-treesitter',
--     run = ':TSUpdate'
--   }
--   use "JoosepAlviste/nvim-ts-context-commentstring"

--   use "kyazdani42/nvim-tree.lua"
--   use 'kyazdani42/nvim-web-devicons' -- File icons
--   use({
--     "nvim-telescope/telescope.nvim", -- fuzzy finder
--     requires = { { "kdheepak/lazygit.nvim" } },
--     config = function()
--         require("telescope").load_extension("lazygit")
--     end,
-- })
--   use 'nvim-telescope/telescope-file-browser.nvim'
--   use 'xiyaowong/telescope-emoji.nvim'
--   use 'windwp/nvim-autopairs'
--   use 'windwp/nvim-ts-autotag'
--   use 'norcalli/nvim-colorizer.lua'
--   use 'folke/zen-mode.nvim'
--   use 'akinsho/nvim-bufferline.lua' -- Tab Workspace
--   use 'lewis6991/gitsigns.nvim'
--   use 'dinhhuy258/git.nvim' -- For git blame & browse
--   use({
--     "iamcco/markdown-preview.nvim",
--     run = function() vim.fn["mkdp#util#install"]() end,
--   })
--   use 'kylechui/nvim-surround' -- Textobject plugins
--   use 'phaazon/hop.nvim' -- jump anyware
--   use 'mbbill/undotree'
-- end)
