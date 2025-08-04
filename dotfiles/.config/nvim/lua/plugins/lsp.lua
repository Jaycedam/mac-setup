return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("pyright")
		vim.lsp.enable("gopls")
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("bashls")
		vim.lsp.enable("astro")
		vim.lsp.enable("html")
		vim.lsp.enable("tailwindcss")
		vim.lsp.enable("cssls")
		vim.lsp.enable("marksman")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("taplo")
		vim.lsp.enable("yamlls")
	end,
}
