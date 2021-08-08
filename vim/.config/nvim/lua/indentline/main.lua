local cmd = vim.api.nvim_command

local g = vim.g

-- Prevent removing quotes from JSON and Dockerfile
cmd([[
  autocmd Filetype json, docker setlocal indentline_setConceal=0
]])

-- Conceal settings
g.indentLine_setConceal = 1
g.indentLine_concealcursor = "inc"
g.indentLine_conceallevel = 2

g.indentLine_char = "|"

g.indentLine_leadingSpaceChar = "•"

-- 16 Color
g.indentLine_color_tty_light = 7 -- (default: 4)
g.indentLine_color_dark = 1 -- (default: 2)

-- 256
g.indentLine_color_term = 239

-- True Color
g.indentLine_color_gui = "#616161"
