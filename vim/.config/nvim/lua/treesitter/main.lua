require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "rust",
    "go",
    "javascript",
    "tsx",
    "typescript",
    "python",
    "c",
    "cpp"
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {}
  }
}
