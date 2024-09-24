return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
    },
    config = function()
        -- language manager config
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls", "astro", "bashls", "html", "marksman", "tailwindcss", "html", "cssls" },
        })
        --[[
    mdx-analyzer mdx_analyzer
        ]] --

        -- compl config
        local cmp = require 'cmp'

        cmp.setup({
            snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                { name = 'buffer' },
            })
        })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- lsp configuration
        local lspconfig = require("lspconfig")
        lspconfig.ts_ls.setup({ capabilities = capabilities })
        lspconfig.bashls.setup({ capabilities = capabilities })
        lspconfig.astro.setup({ capabilities = capabilities })
        lspconfig.lua_ls.setup({ capabilities = capabilities })
        lspconfig.html.setup({ capabilities = capabilities })
        lspconfig.marksman.setup({ capabilities = capabilities })

        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
    end,
}
