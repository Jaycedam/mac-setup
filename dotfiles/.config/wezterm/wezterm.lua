-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

local status = require("status") -- custom status (tabs and info)

-- Font
config.font_size = 16

-- Window
config.window_background_opacity = 0.9
--config.macos_window_background_blur = 20 -- blur
config.window_decorations = "RESIZE" -- removes title bar
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 120
config.initial_rows = 30

-- Tabs
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 30
--config.tab_bar_at_bottom = true

-- Theme
--config.color_scheme = "Dracula (Official)"
--config.color_scheme = "tokyonight"
--config.color_scheme = "Catppuccin Mocha"
config.color_scheme = 'Aura (Gogh)'

config.colors = {
    --background = "black",
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = '#15141b',

        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = '#15141b',
            -- The color of the text for the tab
            fg_color = '#82e2ff',

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            --intensity = 'Bold',
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = '#15141b',
            fg_color = 'white',
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = 'black',
            fg_color = '#82e2ff',
        },
    },
}

return config
