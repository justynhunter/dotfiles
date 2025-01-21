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
                cmd = { "astro-ls", "--stdio" },
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
                cmd = { "elixir-ls" }
            })

            lspconfig.marksman.setup({})

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = 'LSP actions',
                callback = function(args)
                    local bufmap = function(desc)
                        return { buffer = true, desc = desc }
                    end

                    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, bufmap("rename symbol"))
                    vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, bufmap("run codelens"))
                    vim.keymap.set("n", "<leader>lL", vim.lsp.codelens.refresh, bufmap("refresh and run codelens"))

                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufmap("signature help"))
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufmap("go to declaration"))
                    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufmap("code actions"))
                    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufmap("show diagnostic in float"))
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufmap("next diagnostic"))
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufmap("previous diagnostic"))
                end
            })

            vim.opt.completeopt = { "menu", "menuone", "noselect" }
        end
    },
}
