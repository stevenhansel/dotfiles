local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('general/main')
require('nvim-lspconfig/main')
require('treesitter/main')
require('telescope/main')
require('gitgutter/main')
require('hexokinase/main')
require('indentline/main')
require('closetag/main')
require('lualine/main')
require('vim-go/main')
require('vim-svelte-plugin/main')

require('custom/tabline')

cmd 'source ~/.config/nvim/lua/language_mappings.vim'

return require('packer').startup(function(use)
  -- packer, the package manager
  use 'wbthomason/packer.nvim'

  -- finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- ui enchancements
  use 'cormacrelf/vim-colors-github'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- editing helpers
  use 'tpope/vim-commentary'
  use 'yggdroot/indentline'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use { 'rrethy/vim-hexokinase',  run = 'make hexokinase' }

  -- snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  -- language support
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'fatih/vim-go', run = ':GoInstallBinaries' }
  use { 'rust-lang/rust.vim' }
  use 'dart-lang/dart-vim-plugin'
  use 'othree/html5.vim'
  use 'evanleck/vim-svelte'
  use 'leafOfTree/vim-svelte-plugin'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
