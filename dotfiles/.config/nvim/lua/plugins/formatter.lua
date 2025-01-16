return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				astro = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" }, -- TSX
				javascriptreact = { "prettier" }, -- JSX
				css = { "prettier" },
				scss = { "prettier" },
				html = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
				lua = { "stylua" },
				python = { "black" },
				htmldjango = { "djlint" },
				-- TODO: add the rest of ft
			},
			format_after_save = {
				lsp_format = "fallback",
			},
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
				prettier = {
					append_args = { "--tab-width", "4" },
				},
			},
		})
	end,
}
