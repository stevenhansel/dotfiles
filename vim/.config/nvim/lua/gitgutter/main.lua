local cmd = vim.api.nvim_command
local g = vim.g

cmd([[
  highlight GitGutterAdd guifg=#009900 ctermfg=Green
  highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
  highlight GitGutterDelete guifg=#ff2222 ctermfg=Red  
]])

g.gitgutter_enabled = 1
g.gitgutter_async = 0
