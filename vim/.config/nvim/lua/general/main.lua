local set = vim.opt
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- disable readonly
set.ro = false

-- hide intro message
set.shortmess = "I"

-- backup configuration
set.backup = false
set.writebackup = false
set.swapfile = false
set.history = 750

-- tab configuration
set.expandtab = true

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2

set.ai = true
set.si = true
set.wrap = true

-- line numbering
set.number = true
set.relativenumber = true
set.laststatus = 2

-- general mapping
set.clipboard = "unnamedplus"
set.ignorecase = true

-- theme
cmd([[ syntax on ]])
set.encoding = "utf8"
set.ffs = "unix,dos,mac"
set.termguicolors = true

cmd([[ colorscheme kanagawa  ]])

-- cursor
set.guicursor = "a:blinkon1"

-- folding
set.foldcolumn = '1'
set.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
set.foldlevelstart = 99
set.foldenable = true

-- filetype plugins
cmd([[ filetype on ]])
cmd([[ filetype plugin on ]])
cmd([[ filetype indent on ]])

-- fold mappings
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- tab mappings
map("n", "tn", ":tabnew<cr>", { noremap = true })
map("n", "tc", ":tabclose<cr>", { noremap = true })
map("n", "<S-Tab>", ":tabprev<Return>", { noremap = true })
map("n", "<Tab>", ":tabnext<Return>", { noremap = true })

-- window mappings
map("n", "ss", ":split<Return><C-w>w", { noremap = true })
map("n", "sv", ":vsplit<Return><C-w>w", { noremap = true })

map("n", "<Space>", "<C-w>w", { noremap = true })

map("n", "s<left>", "<C-w>h", { noremap = true })
map("n", "s<up>", "<C-w>k", { noremap = true })
map("n", "s<down>", "<C-w>j", { noremap = true })
map("n", "s<right>", "<C-w>l", { noremap = true })

map("n", "sh", "<C-w>h", { noremap = true })
map("n", "sk", "<C-w>k", { noremap = true })
map("n", "sj", "<C-w>j", { noremap = true })
map("n", "sl", "<C-w>l", { noremap = true })

map("n", "csh", "<C-w><", { noremap = true })
map("n", "csk", "<C-w>+", { noremap = true })
map("n", "csj", "<C-w>-", { noremap = true })
map("n", "csl", "<C-w>>", { noremap = true })

map("n", "<leader><space>", ":noh<CR>", { noremap = true, silent = true })

cmd([[
autocmd! CursorMoved * if foldclosed('.') != -1 |
                     \   nnoremap h <nop>|
                     \   nnoremap l <nop>|
                     \ else |
                     \   silent! unmap h|
                     \   silent! unmap l|
                     \ endif
]])

cmd[[
  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]]
