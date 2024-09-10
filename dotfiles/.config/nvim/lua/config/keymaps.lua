-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "File Explorer" }) -- vim file explorer
