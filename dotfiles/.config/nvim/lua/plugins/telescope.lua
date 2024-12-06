return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })

		-- lsp
		vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Find references (LSP)" })
		vim.keymap.set(
			"n",
			"<leader>fd",
			builtin.diagnostics,
			{ desc = "Lists Diagnostics for all open buffers (LSP)" }
		)
		vim.keymap.set(
			"n",
			"<leader>fi",
			builtin.lsp_implementations,
			{ desc = "Lists implementations of cursor (LSP)" }
		)
	end,
}
