return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    enabled = true,
    config = function()
        local surround = require("nvim-surround")
        surround.setup({})
    end
}
