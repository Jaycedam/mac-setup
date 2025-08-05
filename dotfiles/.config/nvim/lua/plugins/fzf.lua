return {
	"ibhagwan/fzf-lua",
	config = function()
		local actions = require("fzf-lua.actions")
		require("fzf-lua").setup({
			fzf_colors = {
				true, -- inherit from nvim theme
			},
			actions = {
				files = {
					true, -- inherit from defaults
					["ctrl-q"] = actions.file_sel_to_qf,
				},
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>f", require("fzf-lua").files, { desc = "Find files" })
		vim.keymap.set("n", "<leader>/", require("fzf-lua").live_grep_native, { desc = "Grep project" })
		vim.keymap.set("v", "<leader>/", require("fzf-lua").grep_visual, { desc = "Grep visual selection" })
		vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Find buffers" })
		vim.keymap.set("n", "<leader>k", require("fzf-lua").keymaps, { desc = "Find keymaps" })
		vim.keymap.set("n", "<leader>h", require("fzf-lua").helptags, { desc = "Find help" })

		-- LSP keymaps
		vim.keymap.set("n", "r", require("fzf-lua").lsp_references, { desc = "Find references (LSP)" })
		vim.keymap.set(
			"n",
			"<leader>i",
			require("fzf-lua").lsp_implementations,
			{ desc = "Find implementations (LSP)" }
		)
		vim.keymap.set(
			"n",
			"<leader>d",
			require("fzf-lua").diagnostics_workspace,
			{ desc = "Find diagnostics on workspace (LSP)" }
		)
		vim.keymap.set(
			"n",
			"<leader>s",
			require("fzf-lua").lsp_document_symbols,
			{ desc = "Find document symbols (LSP)" }
		)
		vim.keymap.set(
			"n",
			"<leader>S",
			require("fzf-lua").lsp_workspace_symbols,
			{ desc = "Find workspace symbols (LSP)" }
		)
		vim.keymap.set("n", "<leader>a", require("fzf-lua").lsp_code_actions, { desc = "Code actions" })

		-- Neovim
		vim.keymap.set("n", "<leader>m", require("fzf-lua").marks, { desc = "Find marks" })
	end,
}
