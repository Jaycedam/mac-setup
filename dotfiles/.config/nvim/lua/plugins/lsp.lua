return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "ts_ls", "astro", "bashls", "html" },
		})

		-- lsp configuration
		local lspconfig = require("lspconfig")
		lspconfig.ts_ls.setup({})
		lspconfig.bashls.setup({})
		lspconfig.astro.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.html.setup({})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
		vim.keymap.set("n", "<C-CR>", vim.lsp.buf.definition, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
