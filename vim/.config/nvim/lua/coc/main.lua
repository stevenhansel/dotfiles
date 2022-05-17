local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

cmd 'source ~/.config/nvim/lua/coc/autocmd.vim'
cmd 'source ~/.config/nvim/lua/coc/function.vim'

-- coc extensions
vim.g['coc_global_extensions'] = {
   -- HTML, CSS, JS/TS
   'coc-eslint',
   'coc-tsserver',
   'coc-tailwindcss',
   'coc-prettier',
   'coc-html',
   'coc-css',
   'coc-svelte',
   -- Go
   'coc-go',
   -- Rust,
   'coc-rust-analyzer',
   -- Flutter
   'coc-flutter',
   -- Python
   'coc-jedi',
   -- Lua
   'coc-sumneko-lua',
   -- C/C++
   'coc-clangd',
   -- SQL
   'coc-sql',
   -- Bash Scripting
   'coc-sh',
   -- Utils
   'coc-json',
   'coc-markdownlint',
   'coc-yaml',
   'coc-snippets',
}

-- mappings
map('n', 'fm', ':CocCommand prettier.formatFile<Return>', {noremap=true, silent=true})
map('i', '<c-space>', 'coc#refresh()', {noremap=true, silent=true, expr=true})
