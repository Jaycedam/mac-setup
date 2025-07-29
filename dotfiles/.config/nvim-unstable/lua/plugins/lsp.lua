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
