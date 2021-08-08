local map = vim.api.nvim_set_keymap
local defaults = { noremap = true, silent = true }

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

map('n', ';f', '<cmd>Telescope find_files<cr>', defaults)
map('n', ';g', '<cmd>Telescope live_grep<cr>', defaults)
