vim.opt.number = true         -- Show current line
vim.opt.relativenumber = true -- Show relative number
vim.opt.smartindent = true

vim.opt.mouse = "a"          -- Enables mouse support

vim.opt.termguicolors = true -- Enables 24-bit RGB color in the TUI.

-- Search
vim.opt.ignorecase = true  -- Ignore case in search patterns.
vim.opt.smartcase = true   -- Override the 'ignorecase' option if the search pattern contains upper case characters.

vim.opt.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

vim.opt.tabstop = 4        -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.

--vim.opt.showmode = false -- disable mode on the command section
vim.opt.title = true -- show title on window
vim.opt.titlestring = " %t" -- show filename on window title

-- Netwr file manager
vim.g.netrw_banner = 0 -- gets rid of the banner for netrw
--vim.g.netrw_liststyle = 3 -- tree style view in netrw

vim.o.splitright = true
vim.o.splitbelow = true

--vim.opt.laststatus = 3    -- Global statusline
-- vim.o.cmdheight = 0 -- Hides command section unless used, disabled until stable
