return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "moyiz/blink-emoji.nvim",
        { "L3MON4D3/LuaSnip", version = "2.*" },
    },
    version = "1.*",

    --@module "blink.cmp"
    --@type blink.cmp.Config
    opts = {
        keymap = { preset = "default" },
        appearance = {
            nerd_font_variant = "mono",
        },
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            documentation = { auto_show = true }
        },
        signature = { enabled = true },
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "emoji" },
            providers = {
                emoji = {
                    module = "blink-emoji",
                    name = "Emoji",
                    score_offset = 15,
                    opts = { insert = true },
                    should_show_items = function()
                        return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
                    end,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        snippets = { preset = "luasnip" },
    },
    opts_extend = { "sources.default" },
}
