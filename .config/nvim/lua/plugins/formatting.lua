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
                css = { "dprint" },
                javascript = { "dprint" },
                javascriptreact = { "dprint" },
                json = { "dprint" },
                lua = { "stylua" },
                markdown = { "deno fmt" },
                typescript = { "dprint" },
                typescriptreact = { "dprint" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 2500,
                lsp_fallback = true,
                -- lsp_format = "fallback",
            },
        })
    end
}
