-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- buffer navigation, similar to tmux
map("n", "<leader>l", ":buffer #<CR>", { desc = "Last buffer" })

-- Open netrw file explorer on the left at 25% width
vim.keymap.set("n", "<leader>e", ":Lex 25<CR>", { noremap = true, silent = true, desc = "File explorer" })

-- map <c-space> to activate completion
map("i", "<c-space>", function()
	vim.lsp.completion.get()
end)

-- Map <leader>y to yank to system clipboard
vim.keymap.set({ "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Toggle Quickfix List
vim.keymap.set("n", "<leader>q", function()
	local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
		return win.quickfix == 1
	end)
	vim.cmd(is_open and "cclose" or "copen")
end, { desc = "Toggle Quickfix List" })

-- replace visual selection across the entire file
vim.keymap.set("v", "<leader>r", function()
	local unpack = unpack or table.unpack
	local _, ls, cs = unpack(vim.fn.getpos("'<"))
	local _, le, ce = unpack(vim.fn.getpos("'>"))
	local lines = vim.fn.getline(ls, le)
	if #lines == 0 then
		return
	end

	lines[#lines] = string.sub(lines[#lines], 1, ce)
	lines[1] = string.sub(lines[1], cs)

	local selection = table.concat(lines, "\n"):gsub("\n", "\\n")
	selection = vim.fn.escape(selection, "/\\")

	-- Clear visual selection and enter command-line mode with prefilled text
	vim.cmd("normal! <Esc>") -- Exit visual mode first
	vim.fn.feedkeys(":%s/" .. selection .. "/", "n") -- 'n' for non-remappable
end, { desc = "Substitute visual selection" })
