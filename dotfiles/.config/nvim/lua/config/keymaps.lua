-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- easier split navigation
map("n", "<C-j>", "<c-w><c-j>", { desc = "Move down split " })
map("n", "<C-k>", "<c-w><c-k>", { desc = "Move up split" })
map("n", "<C-l>", "<c-w><c-l>", { desc = "Move right split" })
map("n", "<C-h>", "<c-w><c-h>", { desc = "Move left split" })

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
