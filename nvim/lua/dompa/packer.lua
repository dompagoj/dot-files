vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-treesitter/nvim-treesitter'

  use 'morhetz/gruvbox'
  use 'tomasiser/vim-code-dark'

  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use 'windwp/nvim-ts-autotag'
  use 'folke/which-key.nvim'
  use 'tpope/vim-commentary'
  use 'nvim-lua/plenary.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'lewis6991/impatient.nvim'
  use 'onsails/lspkind.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  }

  use 'vim-airline/vim-airline'

  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }


  --  ******* Auto complete stuff ********
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Completion framework:
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'


  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-vsnip'


  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-buffer'

  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- ******* Auto complete stuff ********


end)
