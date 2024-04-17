local lualine = require("lualine")
local lsp_status = require("lsp-status")

local function lsp_current_status()
	return lsp_status.status_progress()
end

lualine.setup({
	options = { theme = "everforest" },
	sections = {
		lualine_c = {
			lsp_current_status,
		},
	},
})
