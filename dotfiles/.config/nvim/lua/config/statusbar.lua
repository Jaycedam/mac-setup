--custom hi groups for statusline
local colors = {
    bg = 'black',
    first = '#f694ff',
    second = '#61ffca',
    icon = '#ffca85',
}
--[[
local separator = {
    component = { left = '', right = '' },
    section = { left = '', right = '' },
}
]] --
vim.api.nvim_set_hl(0, 'StatusName', { fg = "black", bg = colors.first, bold = true, })
vim.api.nvim_set_hl(0, 'StatusNameSeparator', { fg = colors.first, bg = "black" })
vim.api.nvim_set_hl(0, 'StatusFile', { fg = "black", bg = colors.second, bold = true, })
vim.api.nvim_set_hl(0, 'StatusFileSeparator', { fg = colors.second, bg = "black" })
vim.api.nvim_set_hl(0, 'StatusIcon', { fg = colors.icon, bg = "black" })
vim.api.nvim_set_hl(0, 'Status', { fg = "white", bg = colors.bg })

function _G.mode_name()
    local mode_map = {
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'VISUAL LINE',
        R = 'REPLACE',
        c = 'COMMAND',
        t = 'TERMINAL'
    }
    local mode = vim.fn.mode()
    return mode_map[mode] or 'UNKNOWN'
end

local statusline = {
    '%#StatusName# %{v:lua.mode_name()} ',
    '%#StatusNameSeparator#',
    '%#WarningMsg#  %#Status#%f',
    '%r', -- read only flag
    '%=', -- divides bar into left/right
    'Line %l/%L',
}

vim.o.statusline = table.concat(statusline, '')
