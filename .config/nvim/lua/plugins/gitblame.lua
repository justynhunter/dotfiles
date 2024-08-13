return {
    "FabijanZulj/blame.nvim",
    config = function()
        require("blame").setup()

        vim.keymap.set("n", "<leader>B", ":BlameToggle<CR>", { desc = "Toggle Git Blame" })
    end
}
