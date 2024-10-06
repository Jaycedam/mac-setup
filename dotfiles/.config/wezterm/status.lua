local wezterm = require("wezterm")
local scheme = wezterm.color.get_builtin_schemes()["tokyonight_moon"]

wezterm.on("update-right-status", function(window, pane)
	-- format definition: https://docs.rs/chrono/latest/chrono/format/strftime/index.html
	local date = wezterm.strftime("%a-%d-%b %H:%M")
	local date_icon = " "

	local battery = ""
	local battery_icon = "󰂁 "
	for _, b in ipairs(wezterm.battery_info()) do
		battery = string.format("%.0f%%", b.state_of_charge * 100)

		if b.state == "Charging" then
			battery_icon = "󰂄 "
		end
	end

	-- Figure out the cwd and host of the current pane.
	-- This will pick up the hostname for the remote host if your
	-- shell is using OSC 7 on the remote host.
	local cwd_uri = pane:get_current_working_dir()
	local cwd = ""
	local cwd_icon = " "

	if cwd_uri then
		local path = cwd_uri.file_path
		for folder in path:gmatch("([^/]+)") do
			cwd = folder -- Update currentFolder with the last matched folder
		end
	end

	-- TODO: move blocks outside in separate functions
	-- see https://wezfurlong.org/wezterm/config/lua/wezterm/format.html?h=wezterm.format
	window:set_right_status(wezterm.format({
		-- cwd
		{ Foreground = { Color = scheme.brights[7] } },
		{ Text = cwd_icon },
		{ Foreground = { Color = scheme.foreground } },
		{ Text = cwd .. "  " },
		-- battery
		{ Foreground = { Color = scheme.brights[3] } },
		{ Text = battery_icon },
		{ Foreground = { Color = scheme.foreground } },
		{ Text = battery .. "  " },
		-- time
		{ Foreground = { Color = scheme.brights[6] } },
		{ Text = date_icon },
		{ Foreground = { Color = scheme.foreground } },
		{ Text = date .. " " },
	}))
end)
