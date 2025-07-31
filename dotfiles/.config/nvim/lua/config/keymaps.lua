-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- buffer navigation
map("n", "<leader>bb", ":buffer #<CR>", { desc = "Go to last buffer" })

-- Open netrw file explorer on the left at 25% width
vim.keymap.set("n", "<leader>e", ":Lex 25<CR>", { noremap = true, silent = true, desc = "File explorer" })

-- map <c-space> to activate completion
map("i", "<c-space>", function()
	vim.lsp.completion.get()
end)

-- Map <leader>y to yank to system clipboard
vim.keymap.set({ "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
