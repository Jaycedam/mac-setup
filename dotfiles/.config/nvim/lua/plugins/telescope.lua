return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Grep" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help" })
    end
}
