vim.opt.number = true -- Show current line
vim.opt.relativenumber = true -- Show relative number

vim.opt.mouse = "a" -- Enables mouse support

vim.opt.termguicolors = true -- Enables 24-bit RGB color in the TUI.

vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.

vim.opt.formatoptions:remove("o") -- Insert mode using "o" doesn't add a comment.

vim.opt.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
