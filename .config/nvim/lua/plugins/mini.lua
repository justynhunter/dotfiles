return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup()
        require("mini.jump").setup()
        require("mini.jump2d").setup()
        require("mini.surround").setup()
    end
}
