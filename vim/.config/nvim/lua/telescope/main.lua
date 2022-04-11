local map = vim.api.nvim_set_keymap
local telescope = require('telescope')

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--line-number',
      '--with-filename',
      '--smart-case',
      '--column',
      '--hidden'
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
telescope.load_extension('fzf')

map('n', ';f', '<cmd>Telescope git_files<cr>', { noremap = true, silent = true })
map('n', ';g', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
