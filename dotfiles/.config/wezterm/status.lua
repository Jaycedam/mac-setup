local wezterm = require("wezterm")

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
        -- text
        { Foreground = { Color = '#ffca85' } },
        { Text = '  ' .. cwd .. ' ' },

        -- text
        { Foreground = { Color = '#f694ff' } },
        { Text = '  ' .. hostname .. ' ' },
    })
end)
