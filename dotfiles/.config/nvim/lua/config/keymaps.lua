-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- easier split navigation, stolen from tj
map("n", "<c-j>", "<c-w><c-j>")
map("n", "<c-k>", "<c-w><c-k>")
map("n", "<c-l>", "<c-w><c-l>")
map("n", "<c-h>", "<c-w><c-h>")

-- quickfix list, todo: add toggle to open/close
map("n", "]q", ":cnext<CR>", { desc = "Quickfix next" })
map("n", "[q", ":cprev<CR>", { desc = "Quickfix next" })

map("n", "<leader>e", ":Ex<CR>", { desc = "File Explorer" }) -- vim file explorer

-- buffer navigation
map("n", "<leader>b", ":buffer #<CR>", { desc = "Go to last buffer" })

-- moves selection up/down, without replacing text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
