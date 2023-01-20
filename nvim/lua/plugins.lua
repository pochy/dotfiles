local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'sainnhe/gruvbox-material'
  use 'eddyekofo94/gruvbox-flat.nvim'
  use 'nvim-lua/plenary.nvim' -- Common utilities(requre null-ls)
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use "numToStr/Comment.nvim" -- Easily comment stuff

  --[[ use 'glepnir/lspsaga.nvim' -- LSP Us ]]
  use({
    "glepnir/lspsaga.nvim", -- LSP UIs
    branch = "main",
    config = function()
        require('lspsaga').setup({})
    end,
  })
  use 'L3MON4D3/LuaSnip' -- Snippet

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  use "kyazdani42/nvim-tree.lua"
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use({
    "nvim-telescope/telescope.nvim", -- fuzzy finder
    requires = { { "kdheepak/lazygit.nvim" } },
    config = function()
        require("telescope").load_extension("lazygit")
    end,
})
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'xiyaowong/telescope-emoji.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use 'akinsho/nvim-bufferline.lua' -- Tab Workspace
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'kylechui/nvim-surround' -- Textobject plugins
  use 'phaazon/hop.nvim' -- jump anyware
  use 'mbbill/undotree'
end)
