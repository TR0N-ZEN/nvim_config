-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt` whatever this means
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- package manager (which can manage itself)
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('mbbill/undotree')

  -- simplyfied installation and configuration of language servers
  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
      -- package manager for LSP servers, DAP servers, linters, and formatters in nvim 
      {'williamboman/mason.nvim'},

      -- bridge between mason.nvim and nvim-lspconfig
      {'williamboman/mason-lspconfig.nvim'},
  
      -- collection of lsp configs
      {'neovim/nvim-lspconfig'},

      --- autocompletion
      -- https://github.com/hrsh7th/nvim-cmp
      {'hrsh7th/nvim-cmp'},
      -- https://github.com/hrsh7th/nvim-cmp
      {'hrsh7th/cmp-nvim-lsp'},
      
      {'L3MON4D3/LuaSnip'},
    }
  }  

  -- install a colorscheme https://github.com/rebelot/kanagawa.nvim
  use ('rebelot/kanagawa.nvim')

end)

