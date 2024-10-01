-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>e", ":25Lex<CR>", { desc = "File Explorer" }) -- vim file explorer

-- easy split navigation
map("n", "<C-h>", "<C-w>h") -- control+h switches to left split
map("n", "<C-l>", "<C-w>l") -- control+l switches to right split
map("n", "<C-j>", "<C-w>j") -- control+j switches to bottom split
map("n", "<C-k>", "<C-w>k") -- control+k switches to top split

-- buffer navigation
map("n", "<C-}>", ":bnext <CR>") -- Tab goes to next buffer
map("n", "<C-{>", ":bprevious <CR>") -- Shift+Tab goes to previous buffer

-- moves selection up/down, without replacing text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", '"', '""<left>') -- double quotes
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>") -- JS comment
