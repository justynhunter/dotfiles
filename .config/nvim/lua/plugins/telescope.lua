return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<leader> ", builtin.find_files, { desc = "find files" })
            vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "[S]earch by [G]rep" })
            vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "search keymaps" })
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "search buffers" })
            vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "search help" })
            vim.keymap.set("n", "<leader>m", builtin.marks, { desc = "search marks" })
            vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols, { desc = "search document symbols" })
            vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols, { desc = "search workspace symbols" })
            vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "find references" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "goto definition" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "find implementations" })
            vim.keymap.set("n", "<leader>ci", builtin.lsp_incoming_calls, { desc = "find callers" })
            vim.keymap.set("n", "<leader>co", builtin.lsp_outgoing_calls, { desc = "find outbound calls" })

            require("telescope").load_extension("ui-select")
        end
    }
}

