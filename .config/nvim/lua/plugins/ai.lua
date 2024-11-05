return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    auto_trigger = true,
                    keymap = {
                        accept = "<C-y>",
                    }
                }
            })
        end
    },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function()
    --         require("copilot_cmp").setup()
    --     end
    -- }
}
-- return {
--     "supermaven-inc/supermaven-nvim",
--     enabled = false,
--     config = function()
--         local supermaven = require("supermaven-nvim")
--         supermaven.setup({
--             disable_keymaps = true,
--             -- keymaps = {
--             --     accept_suggestion = "<Tab>",
--             --     clear_suggestion = "<C-]>",
--             --     accept_word = "<C-v>"
--             -- },
--         })
--
--         vim.keymap.set("n", "<leader>sm", "<cmd>SupermavenToggle<cr>")
--     end
-- }
