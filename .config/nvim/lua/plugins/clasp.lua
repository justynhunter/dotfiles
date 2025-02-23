return {
    "xzbdmw/clasp.nvim",
    config = function()
        require("clasp").setup({
            pairs = { ["{"] = "}", ['"'] = '"', ["'"] = "'", ["("] = ")", ["["] = "]", ["`"] = "`" },
        })

        vim.keymap.set({ "n", "i" }, "<c-f>", function()
            require("clasp").wrap("prev")
        end)
    end
}
