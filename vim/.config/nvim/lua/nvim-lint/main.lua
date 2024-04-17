local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	["javascript.jsx"] = { "eslint_d" },
	["typescript.tsx"] = { "eslint_d" },

	ruby = { "rubocop" },
	["ruby.on_rails"] = { "rubocop" },

	python = { "flake8" },
	["python.django"] = { "flake8" },
}
