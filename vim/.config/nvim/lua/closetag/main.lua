local closetag_regions = {}

closetag_regions["typescript.tsx"] = "jsxRegion,tsxRegion"
closetag_regions["javascript.jsx"] = "jsxRegion"
closetag_regions["typescriptreact"] = "jsxRegion,tsxRegion"
closetag_regions["javascriptreact"] = "jsxRegion"

vim.g["closetag_xhtml_filetypes"] = "xhtml,javascript.jsx,jsx,typescript.tsx,typescriptreact"
vim.g["closetag_xhtml_filenames"] = "*.xhtml,*.js,*.jsx,*.tsx"
vim.g["closetag_filetypes"] = "html,xhtml,phtml,javascript.jsx,jsx,typescript.tsx,typescriptreact"
vim.g["closetag_emptyTags_caseSensitive"] = 1
vim.g["closetag_regions"] = closetag_regions
vim.g["closetag_shortcut"] = ">"
vim.g["closetag_close_shortcut"] = "<leader>>"
