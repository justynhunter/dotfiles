return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        lazy = false,
        config = function()
            local lspconfig = require("lspconfig")

            local servers = {
                ts_ls = {},
                astro = {},
                -- formatters
                dprint = {},
                stylelint_lsp = {},
                -- css
                cssls = {},
                cssmodules_ls = {},
                css_variables = {},
                -- docker
                dockerls = {},
                docker_compose_language_service = {},
                -- go
                gopls = {},
                golangci_lint_ls = {},
                templ = {},
                --other
                lua_ls = {},
                elixirls = { cmd = { "elixir-ls" } },
                marksman = {},
            }

            for server, config in pairs(servers) do
                lspconfig[server].setup(config)
            end

            lspconfig.ocamllsp.setup({})
            lspconfig.gleam.setup({})
            lspconfig.omnisharp.setup({ cmd = { "dotnet", "/Library/omnisharp/OmniSharp.dll" } })

            require("mason").setup({})
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = vim.tbl_keys(servers),
            })

            -- lspconfig.astro.setup({
            --     cmd = { "astro-ls", "--stdio" },
            --     filetypes = { "astro" },
            --     init_options = { typescript = {} },
            --     root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
            -- })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = 'LSP actions',
                callback = function(args)
                    local bufmap = function(desc)
                        return { buffer = true, desc = desc }
                    end

                    vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufmap("rename symbol"))
                    vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, bufmap("run codelens"))
                    vim.keymap.set("n", "<leader>lL", vim.lsp.codelens.refresh, bufmap("refresh and run codelens"))

                    vim.keymap.set("n", "grs", vim.lsp.buf.signature_help, bufmap("signature help"))
                    vim.keymap.set("n", "grD", vim.lsp.buf.declaration, bufmap("go to declaration"))
                    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, bufmap("code actions"))
                    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufmap("show diagnostic in float"))
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufmap("next diagnostic"))
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufmap("previous diagnostic"))
                end
            })

            vim.opt.completeopt = { "menu", "menuone", "noselect" }
        end
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        enabled = false,
        config = function()
            require("lsp_lines").setup()
        end
    }
}
