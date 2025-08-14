-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

-- buffer navigation, similar to tmux
map("n", "<leader>l", ":buffer #<CR>", { desc = "Last buffer" })

-- Open netrw file explorer on the left at 25% width
vim.keymap.set("n", "<leader>e", ":Lex 25<CR>", { noremap = true, silent = true, desc = "File explorer" })

-- -- map <c-space> to activate completion
-- map("i", "<c-space>", function()
-- 	vim.lsp.completion.get()
-- end)

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

-- markdown task checkboxes

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Toggle checkbox under cursor
		vim.keymap.set("n", "<leader>c", function()
			local line = vim.api.nvim_get_current_line()
			if line:match("%[ %]") then
				line = line:gsub("%[ %]", "[x]", 1)
			elseif line:match("%[x%]") then
				line = line:gsub("%[x%]", "[ ]", 1)
			end
			vim.api.nvim_set_current_line(line)
		end, { buffer = true, desc = "Toggle markdown task checkbox" })

		-- Create markdown list from selection
		vim.keymap.set("v", "<leader>l", function()
			local s = vim.fn.getpos("'<")[2]
			local e = vim.fn.getpos("'>")[2]
			if s > e then
				s, e = e, s
			end
			for lnum = s, e do
				local line = vim.fn.getline(lnum)
				if line:match("%S") then
					vim.fn.setline(lnum, "- " .. line)
				end
			end
		end, { buffer = true, desc = "Create markdown list from selection" })

		-- Toggle checkbox for visual selection
		vim.keymap.set("v", "<leader>c", function()
			local s = vim.fn.getpos("'<")[2]
			local e = vim.fn.getpos("'>")[2]
			if s > e then
				s, e = e, s
			end

			for lnum = s, e do
				local line = vim.fn.getline(lnum)
				if line:match("%S") and not line:match("%[.%]") then
					vim.fn.setline(lnum, "- [ ] " .. line)
				end
			end
		end, { buffer = true, desc = "Create markdown checkboxes from selection" })
	end,
})
