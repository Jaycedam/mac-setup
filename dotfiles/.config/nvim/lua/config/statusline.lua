function _G.status_mode()
    local mode = vim.fn.mode()
    local name_map = {
        n = "NORMAL",
        i = "INSERT",
        c = "COMMAND",
        v = "VISUAL",
        V = "VISUAL LINE",
        t = "TERMINAL"
    }
    return name_map[mode] or "UNKNOWN"
end

--  
local set_statusline = {
    '%#StatusMode# %{v:lua.status_mode()} %#StatusModeSeparator#',
    '%#StatusFileIcon# ',
    '%#Status# %f',        -- breadcrumbs
    '%#StatusWarning# %m', -- modified file icon
    '%#Status#',
    '%=',                  -- divides bar into left/right
    '%h',                  -- shows if file is of type help
    '%r',                  -- read only flag
    -- TODO: Add git branch, lsp and diagnostic icons
    '%l/%L',               -- current and total lines
}

vim.o.statusline = table.concat(set_statusline, '')
