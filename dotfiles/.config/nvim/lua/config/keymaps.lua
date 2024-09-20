-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer" }) -- vim file explorer

-- easy split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h") -- control+h switches to left split
vim.keymap.set("n", "<C-l>", "<C-w>l") -- control+l switches to right split
vim.keymap.set("n", "<C-j>", "<C-w>j") -- control+j switches to bottom split
vim.keymap.set("n", "<C-k>", "<C-w>k") -- control+k switches to top split

-- buffer navigation
vim.keymap.set("n", "<C-}>", ":bnext <CR>")     -- Tab goes to next buffer
vim.keymap.set("n", "<C-{>", ":bprevious <CR>") -- Shift+Tab goes to previous buffer

-- moves selection up/down, without replacing text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>") -- double quotes
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>") -- JS comment
