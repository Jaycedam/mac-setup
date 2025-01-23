return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	opts = {
		completion = {
			-- Show documentation when selecting a completion item
			menu = {
				border = "single",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "single",
				},
			},
		},

		-- experimental signature help support
		signature = { enabled = true },
	},
}
