local o = vim.o

o.number = true -- Show current line
o.relativenumber = true -- Show relative number

-- UI
o.winborder = "rounded"
-- o.termguicolors = true -- Forces true color support in terminals

-- Search
o.ignorecase = true -- Ignore case in search patterns.
o.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.

o.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

o.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
o.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
o.shiftwidth = 4
o.softtabstop = 4

o.splitright = true
o.splitbelow = true

-- vim.o.cmdheight = 0 -- Hides command section unless used

vim.diagnostic.config({
	virtual_lines = true,
})

-- see `:h completeopt`
o.completeopt = "menuone,noinsert,popup"
