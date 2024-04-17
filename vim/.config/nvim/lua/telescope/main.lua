local map = vim.api.nvim_set_keymap
local telescope = require("telescope")

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--line-number",
			"--with-filename",
			"--smart-case",
			"--column",
			"--hidden",
		},
		initial_mode = "normal",
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			hide_parent_dir = true,
			hidden = true,
			grouped = true,
			hijack_netrw = true,
			git_status = false,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					["l"] = fb_actions.change_cwd,
					["h"] = fb_actions.goto_parent_dir,
					["d"] = fb_actions.remove,
					["n"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["c"] = fb_actions.copy,
					["."] = fb_actions.toggle_hidden,
					["o"] = "select_default",
				},
			},
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
	},
})
telescope.load_extension("fzf")
telescope.load_extension("file_browser")

map("n", ";f", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
map("n", ";g", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
map("n", "sf", "<cmd>Telescope file_browser path=%:p:h<cr>", { noremap = true })
