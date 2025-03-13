-- return {
--     "savq/melange-nvim",
--     name = "melange",
--     config = function()
--         vim.cmd.colorscheme "melange"
--     end
-- }

return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            -- flavour = "latte"
            flavour = "frappe",
            integrations = {
                cmp = true,
                flash = true,
                fzf = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                        ok = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                        ok = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
            },
            custom_highlights = function(colors)
                return {
                    MiniJump = { fg = colors.base, bg = colors.red },
                }
            end,
        })
        vim.cmd.colorscheme "catppuccin"
    end,
}
