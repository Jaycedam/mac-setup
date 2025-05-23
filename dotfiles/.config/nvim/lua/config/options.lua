vim.opt.number = true -- Show current line
vim.opt.relativenumber = true -- Show relative number
vim.opt.smartindent = true

-- UI
vim.opt.termguicolors = true -- Enables 24-bit RGB color in the TUI.
vim.opt.winborder = "rounded"

-- Search
vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.

vim.opt.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for.
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.

-- folds with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Start with folds open

--vim.opt.showmode = false -- disable mode on the command section
vim.opt.title = true -- show title on window
vim.opt.titlestring = "%f (nvim)"

vim.o.splitright = true
vim.o.splitbelow = true

-- vim.o.cmdheight = 0 -- Hides command section unless used, disabled until there's a way to show macros

vim.diagnostic.config({
	virtual_lines = true,
})

-- see `:h completeopt`
vim.opt.completeopt = "menuone,noinsert,popup"
-- map <c-space> to activate completion
vim.keymap.set("i", "<c-space>", function()
	vim.lsp.completion.get()
end)

-- native LSP completion
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})
