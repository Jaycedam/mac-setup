return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,

		config = function()
			require("tokyonight").setup({
				transparent = true,
				dim_inactive = true,
				lualine_bold = true,
				styles = {
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				flavour = "mocha", -- latte, frappe, macchiato, mocha
			})
			-- vim.cmd([[colorscheme catppuccin]])
		end,
	},
}
