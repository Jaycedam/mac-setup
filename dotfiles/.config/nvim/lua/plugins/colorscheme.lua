return {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
        vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
        vim.cmd([[colorscheme aura-dark]])

        -- transparent background
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#29263c", fg = "white" })
    end
}
