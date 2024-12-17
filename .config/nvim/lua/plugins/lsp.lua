return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")

            -- Typescript
            lspconfig.ts_ls.setup({})

            lspconfig.eslint.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })

            lspconfig.astro.setup({
                -- cmd = { "/Users/jhunter/.nodenv/shims/astro-ls", "--stdio" },
                filetypes = { "astro" },
                init_options = { typescript = {} },
                root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
            })
            -- End Typescript

            -- formatters / linters
            lspconfig.dprint.setup({})
            lspconfig.biome.setup({
                filetypes = { "javascript", "javascriptreact", "json", "jsonc", "typescript", "typescript.tsx", "typescriptreact", "astro", "svelte", "vue" }
            })
            lspconfig.stylelint_lsp.setup({})
            -- end formatters / linters

            -- css
            lspconfig.cssls.setup({})
            lspconfig.cssmodules_ls.setup({})
            lspconfig.css_variables.setup({})
            -- end css

            -- others
            lspconfig.lua_ls.setup({})

            lspconfig.gleam.setup({})

            lspconfig.omnisharp.setup({
                cmd = { "dotnet", "/Library/omnisharp/OmniSharp.dll" },

            })

            lspconfig.ocamllsp.setup({})

            -- Go
            lspconfig.gopls.setup({})
            lspconfig.golangci_lint_ls.setup({})
            lspconfig.templ.setup({})
            -- end Go

            lspconfig.elixirls.setup({
                cmd = { "/usr/local/bin/elixir-ls" }
            })

            lspconfig.marksman.setup({})

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
        end
    },
}
