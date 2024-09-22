return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    enabled = false,
    config = function()
        local surround = require("nvim-surround")
        surround.setup({})
    end
}
