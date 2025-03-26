local fn = vim.fn
local cmd = vim.cmd
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("general/main")
require("mason/main")
require("nvim-lspconfig/main")
require("lsp_lines/main")
require("treesitter/main")
require("formatter/main")
require("nvim-lint/main")
require("trouble/main")
require("telescope/main")
require("flash/main")
require("nvim-ufo/main")
require("indentline/main")
require("closetag/main")
require("lualine/main")
require("bufferline/main")
require("gitsigns/main")
require("nvim-colorizer/main")
require("typescript-tools/main")
-- require("copilot/main")
require("theme/main")

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- Mason
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use({ "mfussenegger/nvim-lint" })
	use("nvim-lua/lsp-status.nvim")
	use({
		"folke/trouble.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Autocompletion & AI Tools
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("lukas-reineke/cmp-under-comparator")

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				filetypes = {
					yaml = true,
					yml = true,
				},
			})
		end,
	})
	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Formatter
	use({ "mhartington/formatter.nvim" })

	-- UI Enhancements
	use("rebelot/kanagawa.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })

	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")

	-- Editing Helpers
	use("folke/flash.nvim")
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("tpope/vim-commentary")
	use("yggdroot/indentline")
	use("jiangmiao/auto-pairs")
	use("alvan/vim-closetag")
	use("karb94/neoscroll.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("mg979/vim-visual-multi")

	-- Language Support
	use("fatih/vim-go")
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
