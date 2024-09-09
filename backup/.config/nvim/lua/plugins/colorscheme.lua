return {
	"Mofiqul/dracula.nvim",
	priority = 1000,
	config = function()
		local theme = require("dracula")
		theme.setup({
			transparent_bg = true,
			italic_comment = true,

			overrides = {},
		})
		vim.cmd([[colorscheme dracula]])
	end,
}
