local o = vim.o

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {}
  },
  ensure_installed = {
    "html",
    "css",
    "scss",
    "javascript",
    "json",
    "typescript",
    "tsx",
    "graphql",
    "lua",
    "fish",
    "dockerfile",
    "yaml"
  }
}

-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldenable = false
