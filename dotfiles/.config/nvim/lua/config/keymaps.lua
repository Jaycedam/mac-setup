-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- quickfix list, todo: add toggle to open/close
map("n", "[q", ":cprev<CR>", { desc = "Quickfix previous" })
map("n", "]q", ":cnext<CR>", { desc = "Quickfix next" })

-- buffer navigation
map("n", "<leader>b", ":buffer #<CR>", { desc = "Go to last buffer" })
map("n", "[b", ":bprev<CR>", { desc = "Buffer previous" })
map("n", "]b", ":bnext<CR>", { desc = "Buffer next" })

-- moves selection up/down, without replacing text
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
