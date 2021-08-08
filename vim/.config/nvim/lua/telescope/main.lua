local map = vim.api.nvim_set_keymap
local defaults = { noremap = true, silent = true }

local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
	  mappings = {
	    i = {
		    ["<esc>"] = actions.close
	    },
	  },
	},
	extensions = {
	  fzf = {
	    fuzzy = true, 
	    override_generic_sorter = false,
	    override_file_sorter = true,
	    case_mode = "smart_case",     
	  }
	}
}

require('telescope').load_extension('fzf')

map('n', ';f', '<cmd>Telescope find_files<cr>', defaults)
map('n', ';g', '<cmd>Telescope live_grep<cr>', defaults)
