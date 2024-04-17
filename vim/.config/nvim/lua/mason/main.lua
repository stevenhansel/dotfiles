require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"eslint",
		"gopls",
		"solargraph",
		"pylsp",
		"terraformls",
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"goimports",
		"prettier",
		"stylua",
		"eslint_d",
		"delve",
		"rubocop",
		"black",
		"isort",
		"flake8",
	},
	run_on_start = true,
	auto_update = false,
})
