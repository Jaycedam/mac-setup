return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	opts = {
		completion = {
			-- Show documentation when selecting a completion item
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
		},

		-- experimental signature help support
		signature = { enabled = true },
	},
}
