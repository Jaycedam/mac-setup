local wezterm = require("wezterm")

-- The filled in variant of the < symbol
local rounded_left_separator = wezterm.nerdfonts.ple_left_half_circle_thick
-- The filled in variant of the > symbol
local rounded_right_separator = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

wezterm.on(
    'format-tab-title',
    function(tab)
        local edge_background = 'transparent'
        local background = '#29263c'
        local foreground = 'white'

        if tab.is_active then
            background = '#61ffca'
            foreground = 'black'
        end

        local edge_foreground = background

        local title = tab_title(tab)
        local idx = tab.tab_index
        local tabtext = table.concat({ idx, title }, ' ')

        return {
            -- separator
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = rounded_left_separator },
            -- text
            { Background = { Color = background } },
            { Foreground = { Color = foreground } },
            { Text = tabtext },
            -- separator
            { Background = { Color = edge_background } },
            { Foreground = { Color = edge_foreground } },
            { Text = rounded_right_separator .. ' ' },
        }
    end
)

wezterm.on('update-right-status', function(window, pane)
    -- Figure out the cwd and host of the current pane.
    -- This will pick up the hostname for the remote host if your
    -- shell is using OSC 7 on the remote host.
    local cwd_uri = pane:get_current_working_dir()
    local cwd = ''
    local hostname = ''

    if cwd_uri then
        local path = cwd_uri.file_path
        for folder in path:gmatch("([^/]+)") do
            cwd = folder -- Update currentFolder with the last matched folder
        end
        hostname = cwd_uri.host or wezterm.hostname()

        -- Remove the domain name portion of the hostname
        local dot = hostname:find '[.]'
        if dot then
            hostname = hostname:sub(1, dot - 1)
        end
        if hostname == '' then
            hostname = wezterm.hostname()
        end
    end

    window:set_right_status(wezterm.format {
        -- separator
        { Background = { Color = 'transparent' } },
        { Foreground = { Color = '#ffca85' } },
        { Text = rounded_left_separator },
        -- text
        { Background = { Color = '#ffca85' } },
        { Foreground = { Color = 'black' } },
        { Text = ' ' .. cwd },
        -- separator
        { Background = { Color = "transparent" } },
        { Foreground = { Color = "#ffca85" } },
        { Text = rounded_right_separator .. ' ' },


        -- separator
        { Background = { Color = 'transparent' } },
        { Foreground = { Color = '#f694ff' } },
        { Text = rounded_left_separator },
        -- text
        { Background = { Color = '#f694ff' } },
        { Foreground = { Color = 'black' } },
        { Text = ' ' .. hostname },
        -- separator
        { Background = { Color = "transparent" } },
        { Foreground = { Color = "#f694ff" } },
        { Text = rounded_right_separator },
    })
end)
