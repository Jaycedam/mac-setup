return {
	"neovim/nvim-lspconfig",
	config = function()
		-- lsp configuration
		local lspconfig = require("lspconfig")

		-- manually register mdx, for some reason it's not recognized by default
		vim.filetype.add({
			extension = {
				mdx = "markdown.mdx",
			},
		})

		lspconfig.ts_ls.setup({})
		lspconfig.astro.setup({})
		lspconfig.html.setup({})
		lspconfig.eslint.setup({})
		lspconfig.tailwindcss.setup({})
		lspconfig.cssls.setup({})
		lspconfig.marksman.setup({
			filetypes = { "markdown" },
		})
		lspconfig.mdx_analyzer.setup({
			filetypes = { "markdown.mdx", "mdx" },
		})
		lspconfig.lua_ls.setup({})
		lspconfig.gopls.setup({}) -- go
		lspconfig.bashls.setup({})
		lspconfig.taplo.setup({}) -- toml
		lspconfig.pyright.setup({}) -- python
		lspconfig.fish_lsp.setup({})

		-- keymaps (the rest are in fzf.lua)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition (LSP)" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references (LSP)" })
	end,
}
