local cmd = vim.cmd

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

cmd 'source ~/.config/nvim/lua/coc/autocmd.vim'
