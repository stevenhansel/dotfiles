local saga = require("lspsaga")

local map = vim.api.nvim_set_keymap
local defaults = {noremap = true, silent = true}

saga.init_lsp_saga {
  error_sign = "",
  warn_sign = "",
  hint_sign = "",
  infor_sign = "",
  border_style = "round"
}

map("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", defaults)
map("n", "K", "<Cmd>Lspsaga hover_doc<CR>", defaults)
map("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", defaults)
map("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", defaults)
