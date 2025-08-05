local o = vim.o

o.number = true -- Show current line
o.relativenumber = true -- Show relative number

-- UI
o.winborder = "rounded"
o.termguicolors = true -- Forces true color support in terminals

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Search
o.ignorecase = true -- Ignore case in search patterns.
o.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.

o.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

o.splitright = true
o.splitbelow = true

-- Keep signcolumn on by default
o.signcolumn = "yes"

-- vim.o.cmdheight = 0 -- Hides command section unless used

vim.diagnostic.config({
	virtual_lines = true,
})

-- see `:h completeopt`
o.completeopt = "menuone,noinsert,popup"

-- manually set filetypes not detected by vim
vim.filetype.add({
	filename = {
		[".env"] = "dotenv",
	},
	pattern = {
		[".env.*"] = "dotenv",
	},
})
