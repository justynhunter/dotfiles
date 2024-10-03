return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "latte"
            -- flavour = "frappe"
        })
        vim.cmd.colorscheme "catppuccin"
    end,
}
--
-- return {
--     "savq/melange-nvim",
--     name = "melange",
--     config = function()
--         vim.cmd.colorscheme "melange"
--     end
-- }
