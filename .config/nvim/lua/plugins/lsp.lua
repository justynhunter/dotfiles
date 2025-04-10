return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
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
                rust_analyzer = {},
                ocamllsp = {},
                omnisharp = { cmd = { "dotnet", "/Library/omnisharp/OmniSharp.dll" } },
            }

            local original_capabilities = vim.lsp.protocol.make_client_capabilities()
            local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)

            -- lsps not in mason
            lspconfig.gleam.setup({})

            -- setup deps
            require("mason").setup({})
            require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers or {}) })
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {}, -- vim.tbl_keys(servers),
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        lspconfig[server_name].setup(server)
                    end,
                }
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = 'LSP actions',
                callback = function(event)
                    local bufmap = function(desc)
                        return { buffer = true, desc = desc }
                    end

                    vim.keymap.set("n", "grn", vim.lsp.buf.rename, bufmap("rename symbol"))
                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufmap("signature help"))
                    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufmap("code actions"))
                    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufmap("show diagnostic in float"))
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufmap("next diagnostic"))
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufmap("previous diagnostic"))

                    -- function to resolve difference between 0.11 and 0.10
                    local function client_supports_method(client, method, bufnr)
                        if vim.fn.has("nvim-0.11") == 1 then
                            return client:supports_method(method, bufnr)
                        else
                            return client.supports_method(method, { bufnr = bufnr })
                        end
                    end

                    -- highlight references when resting cursor
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    if
                        client
                        and client_supports_method(
                            client,
                            vim.lsp.protocol.Methods.textDocument_documentHighlight,
                            event.buf
                        )
                    then
                        local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlights", { clear = false })
                        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references
                        })

                        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                            buffer = event.buf,
                            group = highlight_augroup,
                            callback = vim.lsp.buf.clear_references
                        })

                        vim.api.nvim_create_autocmd("LspDetach", {
                            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                            callback = function(event2)
                                vim.lsp.buf.clear_references()
                                vim.api.nvim_clear_autocmds({ group = "lsp-highlights", buffer = event2.buf })
                            end
                        })
                    end
                end
            })

            vim.opt.completeopt = { "menu", "menuone", "noselect" }
        end
    },
}
