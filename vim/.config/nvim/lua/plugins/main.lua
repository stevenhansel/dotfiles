require "paq" {
  "savq/paq-nvim",
  -- nvim-lspconfig
  "neovim/nvim-lspconfig",
  "glepnir/lspsaga.nvim",
  -- Treesitter
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  -- Telescope
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  -- Formatter
  "mhartington/formatter.nvim",
  -- defx
  {"Shougo/defx.nvim", run = ":UpdateRemotePlugins"},
  "kristijanhusak/defx-icons",
  "kristijanhusak/defx-git",
  -- Theme
  "tomasiser/vim-code-dark",
  -- git
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  -- Utilities
  "tpope/vim-commentary",
  "yggdroot/indentline",
  "jiangmiao/auto-pairs",
  "alvan/vim-closetag"
}
