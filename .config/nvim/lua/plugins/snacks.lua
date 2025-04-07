local function normal_mode()
    vim.cmd.stopinsert()
end

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    --@type snacks.Config
    opts = {
        animate = { enabled = true },
        bigfile = { enabled = true },
        picker = { enabled = true },
        quickfile = {
            enabled = true,
            matcher = { frecency = true },
        },
    },
    keys = {
        -- picker
        { "<leader><space>", function() Snacks.picker.smart() end,                                        desc = "Smart Find Files" },
        { "<leader>fb",      function() Snacks.picker.buffers({ on_show = normal_mode }) end,             desc = "Find Buffers" },
        { "<C-CR>",          function() Snacks.picker.buffers({ on_show = normal_mode }) end,             desc = "Find Buffers" },
        { "<D-b>",           function() Snacks.picker.buffers({ on_show = normal_mode }) end,             desc = "Find Buffers" },
        { "<M-b>",           function() Snacks.picker.buffers({ on_show = normal_mode }) end,             desc = "Find Buffers" },
        { "<leader>ff",      function() Snacks.picker.grep() end,                                         desc = "Find Grep" },
        { "<leader>fc",      function() Snacks.picker.command_history() end,                              desc = "Find Command History" },
        { "<leader>fk",      function() Snacks.picker.keymaps() end,                                      desc = "Find keymaps" },
        { "<leader>fn",      function() Snacks.picker.notifications() end,                                desc = "Find Notifications" },
        { "<leader>fr",      function() Snacks.picker.recent() end,                                       desc = "Find Recent" },
        { "<leader>fC",      function() Snacks.picker.commands() end,                                     desc = "Find Commands" },
        { "<leader>fm",      function() Snacks.picker.marks({ on_show = normal_mode }) end,               desc = "Find Marks" },
        { "gr",              function() Snacks.picker.lsp_references({ on_show = normal_mode }) end,      desc = "Find References" },
        { "gd",              function() Snacks.picker.lsp_definitions({ on_show = normal_mode }) end,     desc = "Find Definitions" },
        { "gD",              function() Snacks.picker.lsp_declarations({ on_show = normal_mode }) end,    desc = "Find Declarations" },
        { "gi",              function() Snacks.picker.lsp_implementations({ on_show = normal_mode }) end, desc = "Find Implementations" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,                         desc = "Goto T[y]pe Definition" },
    }
}
