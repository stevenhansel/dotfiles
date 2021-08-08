-- Neovim API Aliases
local cmd = vim.cmd

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

-- Backups
b.swapfile = false

-- Performance Optimization
o.lazyredraw = true
o.history = 500
o.hidden = true

-- Indentation
b.expandtab = true
b.smarttab = true

b.shiftwidth = 2
b.tabstop = 2

b.autoindent = true		
b.smartindent = true
b.wrap = true

-- Folding
b.foldmethod = 'syntax' 
b.foldcolumn = 1 
b.foldlevelstart = 99 

b.javaScript_fold=1
b.typeScript_fold=1
b.javaScriptReact_fold=1
b.typeScriptReact_fold=1

-- Colorscheme
o.termguicolors = true
cmd([[colorscheme codedark]])
