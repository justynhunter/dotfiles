return {
    "FabijanZulj/blame.nvim",
    config = function()
        require("blame").setup()

        vim.keymap.set("n", "<leader>gb", ":BlameToggle<CR>", { desc = "Toggle Git Blame" })
    end
}
