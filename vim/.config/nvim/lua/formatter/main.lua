local formatter = require("formatter")
local util = require("formatter.util")

local prettier = function()
	return {
		exe = "prettier",
		args = {
			"--config-precedence",
			"prefer-file",
			"--stdin-filepath",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
	}
end

formatter.setup({
	logging = false,
	filetype = {
		javascript = { prettier },
		typescript = {
			prettier,
		},
		javascriptreact = { prettier },
		typescriptreact = { prettier },
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--edition=2021 --emit=stdout" },
					stdin = true,
				}
			end,
		},
		go = {
			function()
				return {
					exe = "goimports",
					args = { vim.fn.shellescape(vim.api.nvim_buf_get_name(0)) },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		ruby = {
			function()
				return {
					exe = "rubocop",
					args = {
						"--autocorrect",
						"--stdin",
						util.escape_path(util.get_current_buffer_file_name()),
						"--format files",
						"| awk 'f; /^====================$/{f=1}'",
					},
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "black",
					args = {
						"--quiet",
						"--stdin-filename",
						vim.api.nvim_buf_get_name(0),
						"-",
					},
					stdin = true,
				}
			end,
		},
    terraform = {
      function()
        return {
          exe = "terraform",
          args = {
            "fmt",
            "-",
          },
          stdin = true,
        }
      end,
    },
  },
})
