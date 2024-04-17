local lsp_status = require("lsp-status")
lsp_status.register_progress()

local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")
local cmp = require("cmp")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local path = util.path

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "fm", ":Format<cr>")

local capabilities = vim.tbl_extend(
	"keep",
	cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	lsp_status.capabilities
)

local on_attach = function(client, bufnr)
	lsp_status.on_attach(client)

	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
end

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-c>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

local function get_python_path(workspace)
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return vim.env.VIRTUAL_ENV
	end

	-- Find and use virtualenv via poetry in workspace directory.
	local match = vim.fn.glob(path.join(workspace, "poetry.lock"))
	if match ~= "" then
		local venv = vim.fn.trim(vim.fn.system("poetry --directory " .. workspace .. " env info -p"))
		return venv
	end

	-- Fallback to system Python.
	return "./venv"
end

require("lspconfig")["gopls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	file_types = { "go" },
})

require("lspconfig")["eslint"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
})

require("lspconfig")["pylsp"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				jedi = {
					environment = get_python_path(vim.fn.getcwd()),
				},
				mypy = {
					config_sub_paths = { vim.fn.getcwd() },
				},
				flake8 = {
					enabled = true,
				},
				pycodestyle = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
			},
		},
	},
})

require("lspconfig")["solargraph"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
})

require("lspconfig")["terraformls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
  file_types = { "terraform", "hcl" }
})
