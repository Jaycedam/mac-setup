-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font
config.font_size = 16

-- Window
config.window_background_opacity = 0.9
--config.macos_window_background_blur = 50 -- blur
config.window_decorations = "RESIZE" -- removes title bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 120
config.initial_rows = 30

-- Tabs
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- Theme
config.color_scheme = "Dracula (Official)"
--config.color_scheme = "tokyonight"
--config.color_scheme = "tokyonight_moon"
--config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Catppuccin Macchiato"

config.colors = {
	tab_bar = {
		--background = "transparent",
	},
	background = "#21232c", -- darker background
}

return config
