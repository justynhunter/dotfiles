return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters = {
                dprint = {
                    condition = function(ctx)
                        ---@diagnostic disable-next-line: return-type-mismatch, undefined-field
                        return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
                    end
                }
            },
            formatters_by_ft = {
                astro = { "dprint" },
                javascript = { "dprint" },
                json = { "dprint" },
                lua = { "stylua" },
                markdown = { "deno fmt" },
                typescript = { "dprint" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}
