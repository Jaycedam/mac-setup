return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<C-p>", require("telescope.builtin").find_files, desc = "Find files" },
		{ "<C-b>", require("telescope.builtin").buffers, desc = "Open buffers" },
		{ "<C-g>", require("telescope.builtin").live_grep, desc = "Live grep" },
	},
}
