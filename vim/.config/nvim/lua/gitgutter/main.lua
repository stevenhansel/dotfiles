local set = vim.opt
local cmd = vim.cmd

cmd[[
  highlight GitGutterAdd guifg=#009900 ctermfg=Green
  highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
  highlight GitGutterDelete guifg=#ff2222 ctermfg=Red  
]]
vim.g['gitgutter_enabled'] = 1
vim.g['gitgutter_async'] = 0
