return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                astro = { "dprint" },
                javascript = { "dprint", "biome" },
                json = { "dprint", "biome" },
                lua = { "stylua" },
                markdown = { "deno fmt" },
                typescript = { "dprint", "biome" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}
