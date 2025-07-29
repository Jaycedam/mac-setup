vim.cmd([[colorscheme oxocarbon]])

-- transparent background, remove this if you don't want it
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = vim.api.nvim_get_hl_by_name("LineNr", true).foreground })
vim.api.nvim_set_hl(0, "NonText", { bg = "none", fg = vim.api.nvim_get_hl_by_name("NonText", true).foreground })
