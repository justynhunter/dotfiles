return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            local select_opts = { behavior = cmp.SelectBehavior.Select }
            local luasnip = require("luasnip")

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuThumb"
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuThumb"
                    },
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
                            copilot = "",
                        }

                        item.menu = menu_icon[entry.source.name]
                        return item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
                    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),

                    ["<CR>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            if luasnip.expandable() then
                                luasnip.expand()
                            else
                                cmp.confirm({
                                    select = true,
                                })
                            end
                        else
                            fallback()
                        end
                    end),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.mapping.complete()
                        elseif luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<C-e>"] = cmp.mapping.abort(),
                }),
                sources = cmp.config.sources({
                    { name = "path",      group_index = 2 },
                    { name = "nvim_lsp",  group_index = 2,   keyword_length = 1 },
                    { name = "buffer",    keyword_length = 3 },
                    { name = "luasnip",   group_index = 2 },
                    { name = "buffer" },
                    { name = "supermaven" },
                    -- { name = "copilot",   group_index = 2 },
                }),
            }
        end,
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0,
            })
        end,
    }
}
