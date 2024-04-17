vim.g["indentLine_indentLevel"] = 10

-- Conceal settings
vim.g["indentLine_setConceal"] = 1
vim.g["indentLine_concealcursor"] = "incv"
vim.g["indentLine_conceallevel"] = 2

vim.g["indentLine_char"] = "|"
vim.g["indentLine_leadingSpaceChar"] = "•"

-- 16 Color
vim.g["indentLine_color_tty_light"] = 7
vim.g["indentLine_color_dark"] = 1

-- 256
vim.g["indentLine_color_term"] = 239

-- True Color
vim.g["indentLine_color_gui"] = "#616161"

vim.api.nvim_create_autocmd({ "Filetype" }, {
	pattern = { "json" },
	callback = function()
		vim.g.indentLine_setConceal = 0
	end,
})
