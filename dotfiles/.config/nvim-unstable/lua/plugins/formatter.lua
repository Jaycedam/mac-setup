require("conform").setup({
    formatters_by_ft = {
        python = { "ruff" },
        htmldjango = { "djlint" },
        javascript = { "prettier" },
        astro = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        sh = { "shfmt" },
        zsh = { "shfmt" },

        -- to be reviewed
        markdown = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        lua = { "stylua" },
        -- TODO: add the rest of ft
    },
    format_after_save = {
        lsp_format = "fallback",
    },
    formatters = {
        shfmt = {
            prepend_args = { "-i", "4" },
        },
        prettier = {
            append_args = { "--tab-width", "4" },
        },
    },
})
