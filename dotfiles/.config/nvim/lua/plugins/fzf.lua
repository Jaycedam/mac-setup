return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			actions = {
				files = {
					true, -- inherit from defaults
					["ctrl-q"] = actions.file_sel_to_qf,
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep_native, { desc = "Find in project (grep)" })
		vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find buffers)" })
		vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "Find keymaps" })
		vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "Find help" })

		-- LSP keymaps
		vim.keymap.set("n", "<leader>fr", require("fzf-lua").lsp_references, { desc = "Find references (LSP)" })
		vim.keymap.set(
			"n",
			"<leader>fi",
			require("fzf-lua").lsp_implementations,
			{ desc = "Find implementations (LSP)" }
		)
		vim.keymap.set(
			"n",
			"<leader>fe",
			require("fzf-lua").diagnostics_workspace,
			{ desc = "Find errors on workspace (LSP)" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			require("fzf-lua").lsp_document_symbols,
			{ desc = "Find document symbols (LSP)" }
		)
		vim.keymap.set("n", "<leader>ca", require("fzf-lua").lsp_code_actions, { desc = "Code actions" })
	end,
}
