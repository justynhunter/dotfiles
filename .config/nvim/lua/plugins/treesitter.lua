return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects"
        },
        config = function()
            require 'nvim-treesitter.configs'.setup {
                "nvim-treesitter/playground",
                modules = {},
                ignore_install = {},
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = {
                    "astro",
                    "bash",
                    "c_sharp",
                    "css",
                    "dockerfile",
                    "eex",
                    "elixir",
                    "gitignore",
                    "gleam",
                    "go",
                    "graphql",
                    "heex",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "ocaml",
                    "ocaml_interface",
                    "prisma",
                    "query",
                    "regex",
                    "templ",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                -- disable indentation
                indent = { enable = false },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<M-space>",
                        node_incremental = "<M-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
                            ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
                            ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
                            ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

                            ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
                            ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },

                            ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
                            ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

                            ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
                            ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

                            ["am"] = { query = "@call.outer", desc = "Select outer part of a function call" },
                            ["im"] = { query = "@call.inner", desc = "Select inner part of a function call" },

                            ["af"] = { query = "@function.outer", desc = "Select outer part of a function definition" },
                            ["if"] = { query = "@function.inner", desc = "Select inner part of a function definition" },

                            ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]m"] = { query = "@call.outer", desc = "Next function call start" },
                            ["]f"] = { query = "@function.outer", desc = "Next function definition call start" },
                            ["]c"] = { query = "@class.outer", desc = "Next class start" },
                            ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
                            ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

                            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_next_end = {
                            ["]F"] = { query = "@call.outer", desc = "Next function call start" },
                            ["]M"] = { query = "@function.outer", desc = "Next function definition call start" },
                            ["]C"] = { query = "@class.outer", desc = "Next class start" },
                            ["]I"] = { query = "@conditional.outer", desc = "Next conditional start" },
                            ["]L"] = { query = "@loop.outer", desc = "Next loop start" },
                        },
                        goto_previous_start = {
                            ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
                            ["[m"] = { query = "@function.outer", desc = "Prev function definition call start" },
                            ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                            ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                            ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },

                            ["[s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                            ["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                        },
                        goto_previous_end = {
                            ["[F"] = { query = "@call.outer", desc = "Prev function call start" },
                            ["[M"] = { query = "@function.outer", desc = "Prev function definition call start" },
                            ["[C"] = { query = "@class.outer", desc = "Prev class start" },
                            ["[I"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                            ["[L"] = { query = "@loop.outer", desc = "Prev loop start" },
                        },
                    },
                },
            }
        end
    },
    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            local treesj = require("treesj")
            treesj.setup({})
            vim.keymap.set("n", "<leader>j", treesj.toggle)
        end
    }
}
