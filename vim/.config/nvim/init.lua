local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('general/main')
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
  -- Packer, the package manager :D
  use 'wbthomason/packer.nvim'

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'kyazdani42/nvim-web-devicons'

  -- File exporer
  use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Colorscheme
  use 'cormacrelf/vim-colors-github'

  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- Editing Helpers
  use 'tpope/vim-commentary'
  use 'yggdroot/indentline'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'
  use { 'rrethy/vim-hexokinase',  run = 'make hexokinase' }

  -- Go
  use { 'fatih/vim-go', run = ':GoInstallBinaries' }

  -- Rust
  use { 'rust-lang/rust.vim' }

  -- Dart
  use 'dart-lang/dart-vim-plugin'

  -- HTML, CSS, JS/TS
  use 'othree/html5.vim'

  use 'pangloss/vim-javascript'
  use 'HerringtonDarkholme/yats.vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'evanleck/vim-svelte'
  use 'leafOfTree/vim-svelte-plugin'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
