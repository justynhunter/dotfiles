return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local todo = require("todo-comments")
        todo.setup({})
        vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>", { desc = "Open Todos in Telescope" })
        vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>", { desc = "Open Todos in QF list" })
    end
}
