return {
    -- "savq/melange-nvim",
    "catppuccin/nvim",
    -- "rose-pine/neovim",
    lazy = false,
    -- name = "melange",
    name = "catppuccin",
    -- name = "rose-pine",
    priority = 1000,
    config = function()
        -- vim.cmd.colorscheme "melange"

        require("catppuccin").setup({
            flavour = "frappe"
        })
        vim.cmd.colorscheme "catppuccin"

        -- vim.cmd.colorscheme "rose-pine"
    end
}
