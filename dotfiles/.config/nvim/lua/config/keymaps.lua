-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "<leader>e", ":Ex<CR>", { desc = "File Explorer" }) -- vim file explorer

-- buffer navigation
map("n", "<leader>gn", ":bnext <CR>", { desc = "[G]o to next buffer" })
map("n", "<leader>gp", ":bprevious <CR>", { desc = "[G]o to previous buffer" })

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
