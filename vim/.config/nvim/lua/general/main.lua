local set = vim.opt
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

-- hide intro message
set.shortmess = 'I'

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
set.clipboard = 'unnamedplus'
set.ignorecase = true

-- folding
set.foldmethod = 'syntax'
set.foldnestmax = 1
set.foldlevelstart = 1

-- syntax highlighting
cmd[[ syntax on ]]
set.encoding = 'utf8'
set.ffs = 'unix,dos,mac'

-- colorscheme
set.termguicolors = true
set.background = 'dark'
cmd[[ set t_Co=256 ]]
cmd[[ colorscheme github ]]

-- filetype plugins
cmd[[ filetype on ]]
cmd[[ filetype plugin on ]]
cmd[[ filetype indent on ]]

-- tab mappings
map('n', 'tn', ':tabnew<cr>', {noremap = true})
map('n', 'tc', ':tabclose<cr>', {noremap = true})
map('n', '<S-Tab>', ':tabprev<Return>', {noremap=true})
map('n', '<Tab>', ':tabnext<Return>', {noremap=true})

-- window mappings
map('n', 'ss', ':split<Return><C-w>w', {noremap=true})
map('n', 'sv', ':vsplit<Return><C-w>w', {noremap=true})

map('n', '<Space>', '<C-w>w', {noremap=true})

map('n', 's<left>', '<C-w>h', {noremap=true})
map('n', 's<up>', '<C-w>k', {noremap=true})
map('n', 's<down>', '<C-w>j', {noremap=true})
map('n', 's<right>', '<C-w>l', {noremap=true})

map('n', 'sh', '<C-w>h', {noremap=true})
map('n', 'sk', '<C-w>k', {noremap=true})
map('n', 'sj', '<C-w>j', {noremap=true})
map('n', 'sl', '<C-w>l', {noremap=true})

map('n', 'csh', '<C-w><', {noremap=true})
map('n', 'csk', '<C-w>+', {noremap=true})
map('n', 'csj', '<C-w>-', {noremap=true})
map('n', 'csl', '<C-w>>', {noremap=true})
