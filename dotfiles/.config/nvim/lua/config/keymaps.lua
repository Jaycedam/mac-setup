-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- buffer navigation
map("n", "<leader>bb", ":buffer #<CR>", { desc = "Go to last buffer" })
