local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- rnvimr configuration
vim.g['rnvimr_enable_ex'] = 1
vim.g['rnvimr_enable_picker'] = 1

vim.g['rnvimr_edit_cmd'] = 'drop'
vim.g['rnvimr_hide_gitignore'] = 0

vim.g['rnvimr_draw_border'] = 0
vim.g['rnvimr_enable_bw'] = 1
vim.g['rnvimr_shadow_winblend'] = 70

vim.g['rnvimr_ranger_cmd'] = 'ranger --cmd="set draw_borders both"'

cmd[[ highlight link RnvimrNormal CursorLine ]]

-- rnvimr mappings 
map('n', 'sf', ':RnvimrToggle<CR>', {noremap=true, silent=true})
