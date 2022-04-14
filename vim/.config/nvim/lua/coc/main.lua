local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

cmd 'source ~/.config/nvim/lua/coc/autocmd.vim'
cmd 'source ~/.config/nvim/lua/coc/function.vim'

-- coc extensions
vim.g['coc_global_extensions'] = {
   'coc-json',
   'coc-snippets',
   'coc-tsserver',
   'coc-prettier',
   'coc-eslint',
   'coc-clangd',
   'coc-elixir',
   'coc-python',
   'coc-tailwindcss',
   'coc-go',
}

-- mappings
map('n', 'fm', ':CocCommand prettier.formatFile<Return>', {noremap=true, silent=true})
map('i', '<c-space>', 'coc#refresh()', {noremap=true, silent=true, expr=true})
