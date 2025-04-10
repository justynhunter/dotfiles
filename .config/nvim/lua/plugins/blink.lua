return {
    "saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
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
        completion = { documentation = { auto_show = true } },
        signature = { enabled = true },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        snippets = { preset = "luasnip" },
    },
    opts_extend = { "sources.default" },
}
