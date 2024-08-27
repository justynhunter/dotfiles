return {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
        -- require("catppuccin").setup({
        --     flavour = "frappe"
        -- })
        -- vim.cmd.colorscheme "catppuccin"

        vim.cmd.colorscheme "rose-pine"
    end,
}
