local cmd = vim.api.nvim_command
local g = vim.g

cmd([[
  autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
]])

local closetag_regions = {}

closetag_regions['typescript.tsx'] = 'jsxRegion,tsxRegion'
closetag_regions['javascript.jsx'] = 'jsxRegion'
closetag_regions['typescriptreact'] = 'jsxRegion,tsxRegion'
closetag_regions['javascriptreact'] = 'jsxRegion'

vim.g.closetag_regions = closetag_regions

g.closetag_xhtml_filetypes = 'xhtml,javascript.jsx,jsx,typescript.tsx,typescriptreact'
g.closetag_xhtml_filenames = '*.xhtml,*.js,*.jsx,*.tsx'
g.closetag_filetypes = 'html,xhtml,phtml,javascript.jsx,jsx,typescript.tsx,typescriptreact'
g.closetag_emptyTags_caseSensitive = 1
g.closetag_shortcut = '>'
g.closetag_close_shortcut = '<leader>>'
