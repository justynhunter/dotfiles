return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    options = {
        theme = "base16"
    },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                    },
                },
                lualine_c = {
                    {
                        "filename", path = 1
                    },
                    -- {
                    -- require("noice").api.statusline.mode.get,
                    -- cond = require("noice").api.statusline.mode.has,
                    -- color = { fg = "#ff9e64" },
                    -- },
                },
            },
        })
    end
}
