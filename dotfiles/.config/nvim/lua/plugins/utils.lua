return {
	{
		"folke/which-key.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {
			preset = "modern",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("mini.pairs").setup()
			require("mini.icons").setup()
			require("mini.surround").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		version = "*",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
