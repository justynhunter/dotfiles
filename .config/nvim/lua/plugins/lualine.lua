return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    options = {
        theme = "base16"
    },
    config = function()
        require("lualine").setup({})
        -- local theme = require("lualine.themes.seoul256")
    end
}
