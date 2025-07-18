return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        local luasnip = require("luasnip")
        local snippet = luasnip.snippet
        local i = luasnip.insert_node
        local extras = require("luasnip.extras")
        local rep = extras.rep
        local fmt = require("luasnip.extras.fmt").fmt

        luasnip.add_snippets("typescriptreact", {
            snippet("lpstory", fmt(
                [[
                import {{ faker }} from "@/utils/faker";
                import type {{ Meta, StoryObj }} from "@storybook/nextjs";
                import {{ fn, within }} from "storybook/test";
                import {{ {} }} from "./index";

                const meta: Meta<typeof {}> = {{
                    component: {},
                }};

                export default meta;
                type Story = StoryObj<typeof {}>;

                export const Default: Story = {{
                    args: {{
                        {}
                    }},
                }};
                ]], {
                    i(1), rep(1), rep(1), rep(1), i(2)
                }
            ))
        })
    end
}
