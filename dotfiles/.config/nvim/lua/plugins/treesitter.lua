return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"javascript",
			"typescript",
			"tsx",
			"astro",
			"lua",
			"html",
			"css",
			"bash",
			"python",
			"rust",
			"go",
		})
	end,
}
