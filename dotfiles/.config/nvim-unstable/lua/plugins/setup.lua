vim.pack.add({
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/stevearc/conform.nvim", version = "stable" },
	{ src = "https://github.com/ibhagwan/fzf-lua", version = vim.version.range("*") },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/neovim/nvim-lspconfig", vim.version.range("*") },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", vim.version.range("*") },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", vim.version.range("*") },
	{ src = "https://github.com/folke/which-key.nvim", vim.version.range("*") },
	{ src = "https://github.com/echasnovski/mini.nvim", vim.version.range("*") },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", vim.version.range("*") },
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" }, -- temp theme
})

-- setup plugins
require("supermaven-nvim").setup({})
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.surround").setup()
require("gitsigns").setup()

-- setup with extra config
require("plugins.fzf")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.linter")
require("plugins.formatter")
require("plugins.theme")
