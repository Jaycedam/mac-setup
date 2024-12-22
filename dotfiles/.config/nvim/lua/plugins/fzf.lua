return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			files = {
				actions = { ["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf } },
			},
		})

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "[F]ind files" })
		vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep_native, { desc = "[F]ind in project (grep)" })
		vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "[F]ind buffers)" })
		vim.keymap.set("n", "<leader>fk", require("fzf-lua").keymaps, { desc = "[F]ind keymaps" })
		vim.keymap.set("n", "<leader>fh", require("fzf-lua").helptags, { desc = "[F]ind help" })

		-- LSP keymaps
		vim.keymap.set("n", "<leader>gr", require("fzf-lua").lsp_references, { desc = "[G]o to references" })
		vim.keymap.set("n", "<leader>gd", require("fzf-lua").lsp_definitions, { desc = "[G]o to definitions" })
		vim.keymap.set("n", "<leader>gi", require("fzf-lua").lsp_implementations, { desc = "[G]o to implementations" })
		vim.keymap.set("n", "<leader>ge", require("fzf-lua").diagnostics_workspace, { desc = "[G]o to diagnostics)" })
		vim.keymap.set("n", "<leader>ca", require("fzf-lua").lsp_code_actions, { desc = "[C]ode actions" })
	end,
}
