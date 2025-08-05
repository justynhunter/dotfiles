return {
    "kylechui/nvim-surround",
    enabled = false,
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end,
}
