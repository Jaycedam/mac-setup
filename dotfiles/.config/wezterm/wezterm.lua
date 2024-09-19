-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Font
config.font_size = 16

-- Window
config.window_background_opacity = 0.8
--config.macos_window_background_blur = 50 -- blur
config.window_decorations = "RESIZE" -- removes title bar
config.adjust_window_size_when_changing_font_size = false
config.initial_cols = 120
config.initial_rows = 30

-- Tabs
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 30
config.tab_bar_at_bottom = true
--config.hide_tab_bar_if_only_one_tab = true

-- Theme
--config.color_scheme = "Dracula (Official)"
--config.color_scheme = "tokyonight"
--config.color_scheme = "tokyonight_moon"
--config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = 'Aura (Gogh)'

config.colors = {
    --background = "black",
    tab_bar = {
        -- The color of the strip that goes along the top of the window
        -- (does not apply when fancy tab bar is in use)
        background = 'transparent',

        -- The active tab is the one that has focus in the window
        active_tab = {
            -- The color of the background area for the tab
            bg_color = '#61ffca',
            -- The color of the text for the tab
            fg_color = 'black',

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            --intensity = 'Bold',
        },

        -- Inactive tabs are the tabs that do not have focus
        inactive_tab = {
            bg_color = 'transparent',
            fg_color = 'white',
        },

        -- You can configure some alternate styling when the mouse pointer
        -- moves over inactive tabs
        inactive_tab_hover = {
            bg_color = '#3b3052',
            fg_color = '#909090',
        },
    },
}

-- auto maximize on startup
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return config
