return {
	"ibhagwan/fzf-lua",
	config = function()
		-- calling `setup` is optional for customization
		-- require("fzf-lua").setup({})

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Fzf files" })
		vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep_native, { desc = "Live grep project" })
		vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Fzf buffers" })
		vim.keymap.set("n", "<leader>fr", require("fzf-lua").lsp_references, { desc = "LSP references" })
		vim.keymap.set("n", "<leader>fd", require("fzf-lua").lsp_definitions, { desc = "LSP definitions" })
		vim.keymap.set("n", "<leader>fi", require("fzf-lua").lsp_implementations, { desc = "LSP implementations" })
		vim.keymap.set("n", "<leader>fe", require("fzf-lua").diagnostics_workspace, { desc = "Workspace Diagnostics" })
		vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "Fzf Keymaps" })
	end,
}
