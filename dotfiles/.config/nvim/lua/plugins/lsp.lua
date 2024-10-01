return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
	config = function()
		-- compl config
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					--require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
	end,
}
