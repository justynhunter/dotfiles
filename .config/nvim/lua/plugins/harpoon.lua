return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>ha", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<leader>hs", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<leader>hd", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<leader>hf", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<leader>hg", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<leader>hh", function() ui.nav_file(5) end)
        vim.keymap.set("n", "<leader>hj", function() ui.nav_file(6) end)
        vim.keymap.set("n", "<leader>hk", function() ui.nav_file(7) end)
        vim.keymap.set("n", "<leader>hl", function() ui.nav_file(8) end)
        vim.keymap.set("n", "<leader>h;", function() ui.nav_file(9) end)

        vim.keymap.set("n", "<Tab>", function() ui.nav_next() end)
        vim.keymap.set("n", "<S-Tab>", function() ui.nav_prev() end)
    end
}
