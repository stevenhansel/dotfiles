vim.g['Hexokinase_refreshEvents'] = {'InsertLeave'}
vim.g['Hexokinase_optInPatterns'] = {
     'full_hex',
     'triple_hex',
     'rgb',
     'rgba',
     'hsl',
     'hsla',
     'colour_names'
   }
vim.g['Hexokinase_highlighters'] = {'backgroundfull'}

-- Reenable hexokinase on enter
vim.cmd 'source ~/.config/nvim/lua/hexokinase/autocmd.vim'
