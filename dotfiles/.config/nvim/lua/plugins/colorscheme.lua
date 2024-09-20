return {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
        vim.cmd([[colorscheme aura-dark]])
        --
        -- transparent background
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

        --custom hi groups for statusline
        local colors = {
            black = 'black',
            pink = "#f694ff",
            blue = '#82e2ff',
            yellow = "#ffca85",
            green = "#61ffca"
        }

        vim.api.nvim_set_hl(0, 'Status', { fg = "white", bg = colors.black })
        vim.api.nvim_set_hl(0, 'StatusMode', { fg = "black", bg = colors.pink, bold = true, })
        vim.api.nvim_set_hl(0, 'StatusModeSeparator', { fg = colors.pink, bg = colors.black })
        vim.api.nvim_set_hl(0, 'StatusFile', { fg = "white", bg = colors.black, })
        vim.api.nvim_set_hl(0, 'StatusFileIcon', { fg = colors.green, bg = colors.black })
        vim.api.nvim_set_hl(0, 'StatusWarning', { fg = colors.yellow, bg = colors.black })
    end
}
