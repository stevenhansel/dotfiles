-- Main entrypoint for plugins, managed by paq.nvim
require("plugins/main")

-- General stuff, such as basic nvim mappings and settings
require("general/mappings")
require("general/settings")

-- Plugin configuration
require("nvim-lspconfig/main")
require("nvim-lspsaga/main")
require("nvim-compe/main")
require("lualine/main")
require("nvim-treesitter/main")
require("telescope/main")
require("defx/main")
require("indentline/main")
require("gitgutter/main")
require("closetag/main")
require("formatter/main")
require("presence/main")
