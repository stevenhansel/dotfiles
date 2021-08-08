-- Neovim API Aliases
local cmd = vim.api.nvim_command

local g = vim.g			-- Global Variables
local o = vim.o			-- Global Options
local b = vim.b			-- Buffer Scoped Options
local w = vim.w			-- Window Scoped Options

-- General 
o.syntax = 'enable'
o.mouse = 'a'
o.clipboard = 'unnamedplus'

o.ignorecase = true
o.smartcase = true

o.shortmess = 'I'

-- Backups
b.swapfile = false

-- Performance Optimization
o.lazyredraw = true
o.history = 500
o.hidden = true

-- Indentation
o.expandtab = true
o.smarttab = true

o.shiftwidth = 2
o.tabstop = 2

o.autoindent = true		
o.smartindent = true
o.wrap = true

-- Folding
o.foldmethod = 'syntax' 
o.foldcolumn = "1"
o.foldlevelstart = 99 

-- Colorscheme
o.termguicolors = true
cmd([[colorscheme codedark]])
