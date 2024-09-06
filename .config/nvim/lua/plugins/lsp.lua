return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Typescript
            lspconfig.ts_ls.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.eslint.setup({
                capabilities = lsp_capabilities,
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })

            lspconfig.astro.setup({
                capabilities = lsp_capabilities,
                cmd = { "/Users/jhunter/.nodenv/shims/astro-ls", "--stdio" },
                filetypes = { "astro" },
                init_options = { typescript = {} },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
            })
            -- End Typescript

            -- formatters / linters
            lspconfig.dprint.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.biome.setup({
                capabilities = lsp_capabilities,
                filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescript.tsx", "typescriptreact", "astro", "svelte", "vue" }
            })
            lspconfig.stylelint_lsp.setup({
                capabilities = lsp_capabilities,
            })
            -- end formatters / linters

            -- css
            lspconfig.cssls.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.cssmodules_ls.setup({
                capabilities = lsp_capabilities,
            })
            lspconfig.css_variables.setup({
                capabilities = lsp_capabilities,
            })
            -- end css

            -- others
            lspconfig.lua_ls.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.gleam.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.omnisharp.setup({
                cmd = { "dotnet", "/Library/omnisharp/OmniSharp.dll" },
                capabilities = lsp_capabilities,
            })

            lspconfig.ocamllsp.setup({
                capabilities = lsp_capabilities,
            })

            -- Go
            lspconfig.gopls.setup({
                capabilities = lsp_capabilities,
            })

            lspconfig.golangci_lint_ls.setup({
                capabilities = lsp_capabilities,
            })
            -- end Go

            lspconfig.elixirls.setup({
                capabilities = lsp_capabilities,
                cmd = { "/usr/local/bin/elixir-ls" }
            })

            lspconfig.marksman.setup({
                capabilities = lsp_capabilities,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = 'LSP actions',
                callback = function(args)
                    local bufmap = function(mode, lhs, rhs, desc)
                        local opts = { buffer = true, desc = desc }
                        vim.keymap.set(mode, lhs, rhs, opts)
                    end

                    bufmap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", "show help hover")
                    bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "signature help?")
                    bufmap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", "rename symbol")
                    -- Selects a code action available at the current cursor position
                    bufmap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', "code actions")
                    -- Show diagnostics in a floating window
                    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', "show diagnostic in float")
                    -- Move to the previous diagnostic
                    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', "next diagnostic")
                    -- Move to the next diagnostic
                    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', "previous diagnostic")
                end
            })

            vim.opt.completeopt = { "menu", "menuone", "noselect" }

            local cmp = require("cmp")

            local select_opts = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp",  keyword_length = 1 },
                    { name = "buffer",    keyword_length = 3 },
                    { name = "supermaven" },
                },
                window = {
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    expandable_indicator = true,
                    fields = { 'menu', 'abbr', 'kind' },
                    format = function(entry, item)
                        local menu_icon = {
                            nvim_lsp = 'λ',
                            luasnip = '⋗',
                            buffer = 'Ω',
                            path = '🖫',
                            supermaven = '⚡',
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                },
            })
        end
    },
}
