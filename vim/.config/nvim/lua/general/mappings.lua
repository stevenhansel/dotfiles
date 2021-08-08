local map = vim.api.nvim_set_keymap
local defaults = {noremap = true, silent = true}

-- Selecting all text in the current active file
map("n", "<C-a>", "gg<S-v>G", defaults)

-- Removing search results
map("n", "<leader><space>", ":noh<Return>", defaults)

-- Tab Management
map("n", "tn", ":tabnew<Return>", defaults)
map("n", "tc", ":tabclose<Return>", defaults)
map("n", "<S-Tab>", ":tabprev<Return>", defaults)
map("n", "<Tab>", ":tabnext<Return>", defaults)

-- Pane Splitting
map("n", "ss", ":split<Return><C-w>w", defaults)
map("n", "sv", ":vsplit<Return><C-w>w", defaults)

-- Pane Navigation
map("n", "<Space>", "<C-w>w", defaults) -- Navigate to next pane with Space

map("", "s<left>", "<C-w>h", defaults) -- Navigate to left pane
map("", "s<right>", "<C-w>l", defaults) -- Navigate to right pane
map("", "s<up>", "<C-w>k", defaults) -- Navigate to top pane
map("", "s<down>", "<C-w>j", defaults) -- Navigate to the bottom pane

map("", "sh", "<C-w>h", defaults) -- Navigate to the left pane
map("", "sl", "<C-w>l", defaults) -- Navigate to the right pane
map("", "sk", "<C-w>k", defaults) -- Navigate to the top pane
map("", "sj", "<C-w>j", defaults) -- Navigate to the bottom pane
