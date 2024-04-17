require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python",
		"ruby",
		"go",
		"javascript",
		"typescript",
		"tsx",
		"hcl",
	},
	sync_install = false,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
})
