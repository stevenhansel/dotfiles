require "paq" {
  "savq/paq-nvim",
  -- nvim-lspconfig
  "neovim/nvim-lspconfig",
  "glepnir/lspsaga.nvim",
  -- Telescope
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  {"nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  -- Autocompletion
  "hrsh7th/nvim-compe",
  -- Treesitter
  {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
  -- Formatter
  "mhartington/formatter.nvim",
  -- defx
  {"Shougo/defx.nvim", run = ":UpdateRemotePlugins"},
  "kristijanhusak/defx-icons",
  "kristijanhusak/defx-git",
  -- import cost
  {"yardnsm/vim-import-cost", run = "npm install"},
  -- Presence
  "andweeb/presence.nvim",
  -- Theme
  "tomasiser/vim-code-dark",
  -- Statusline
  "hoob3rt/lualine.nvim",
  -- git
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",
  -- Snippets
  "honza/vim-snippets",
  -- Utilities
  "kyazdani42/nvim-web-devicons",
  "tpope/vim-commentary",
  "yggdroot/indentline",
  "jiangmiao/auto-pairs",
  "alvan/vim-closetag"
}
