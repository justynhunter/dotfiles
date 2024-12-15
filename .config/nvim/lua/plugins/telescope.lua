return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    fzf = {},
                },
            })
            require("telescope").load_extension("fzf")

            function vim.getVisualSelection()
                vim.cmd('noau normal! "vy"')
                local text = vim.fn.getreg('v')
                vim.fn.setreg('v', {})

                text = string.gsub(text, "\n", "")
                if #text > 0 then
                    return text
                else
                    return ''
                end
            end

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader> ", builtin.find_files, { desc = "find files" })
            vim.keymap.set("v", "<leader> ", function()
                local text = vim.getVisualSelection()
                builtin.find_files({ default_text = text, desc = "find selection in files" })
            end)
            vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "Search by Grep" })
            vim.keymap.set("v", "<leader>f", function()
                local text = vim.getVisualSelection()
                builtin.live_grep({ default_text = text, desc = "Search selection by Grep" })
            end)
            vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "search keymaps" })
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "search buffers" })
            vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "search help" })
            vim.keymap.set("n", "<leader>m", builtin.marks, { desc = "search marks" })
            vim.keymap.set("n", "<leader>sd", builtin.lsp_document_symbols, { desc = "search document symbols" })
            vim.keymap.set("n", "<leader>sw", builtin.lsp_workspace_symbols, { desc = "search workspace symbols" })
            vim.keymap.set("n", "grr", builtin.lsp_references, { desc = "find references" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "goto definition" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "find implementations" })

            require("telescope").load_extension("ui-select")
        end
    }
}
