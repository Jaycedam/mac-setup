return {
	"neovim/nvim-lspconfig",
	config = function()
		-- comp config
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		-- lsp configuration
		local lspconfig = require("lspconfig")

		-- manually register mdx, for some reason it's not recognized by default
		vim.filetype.add({
			extension = {
				mdx = "markdown.mdx",
			},
		})

		lspconfig.ts_ls.setup({ capabilities = capabilities })
		lspconfig.astro.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.eslint.setup({ capabilities = capabilities })
		lspconfig.tailwindcss.setup({ capabilities = capabilities })
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.marksman.setup({
			filetypes = { "markdown" },
			capabilities = capabilities,
		})
		lspconfig.mdx_analyzer.setup({
			filetypes = { "markdown.mdx", "mdx" },
			capabilities = capabilities,
		})
		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.gopls.setup({ capabilities = capabilities }) -- go
		lspconfig.bashls.setup({ capabilities = capabilities })
		lspconfig.taplo.setup({ capabilities = capabilities }) -- toml

		-- keymaps (the rest are in fzf.lua)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition (LSP)" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references (LSP)" })
	end,
}
