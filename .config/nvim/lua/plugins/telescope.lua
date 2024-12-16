return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-media-files.nvim"
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
                extensions = {
                    fzf = {},
                    media_files = {
                        filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
                        find_cmd = "rg"
                    }
                },
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.cycle_history_next,
                            ["<C-k>"] = actions.cycle_history_prev,
                        }
                    }
                }
            })
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("media_files")

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
            local ext = require("telescope").extensions
            vim.keymap.set("n", "<leader> ", builtin.find_files, { desc = "find files" })
            vim.keymap.set("v", "<leader> ", function()
                local text = vim.getVisualSelection()
                builtin.find_files({ default_text = text, desc = "find selection in files" })
            end)
            vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Search by Grep" })
            vim.keymap.set("v", "<leader>ff", function()
                local text = vim.getVisualSelection()
                builtin.live_grep({ default_text = text, desc = "Search selection by Grep" })
            end)
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "search keymaps" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "search buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "search help" })
            vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "search marks" })
            vim.keymap.set("n", "<leader>fds", builtin.lsp_document_symbols, { desc = "search document symbols" })
            vim.keymap.set("n", "<leader>fws", builtin.lsp_workspace_symbols, { desc = "search workspace symbols" })
            vim.keymap.set("n", "<leader>fi", ext.media_files.media_files)
            vim.keymap.set("n", "grr", builtin.lsp_references, { desc = "find references" })
            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "goto definition" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "find implementations" })
        end
    }
}
