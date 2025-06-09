vim.g.mapleader = " "

-- netrw
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

-- search
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "clear search" })

--quickfix list
local function toggle_quickfix()
    local windows = vim.fn.getwininfo()
    for _, win in pairs(windows) do
        if win["quickfix"] == 1 then
            vim.cmd.cclose()
            return
        end
    end
    vim.cmd.copen()
end
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
vim.keymap.set("n", "<leader>q", toggle_quickfix, { desc = "toggle quickfix list" })
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.setqflist()<CR><cmd>copen<CR>",
    { desc = "send diagnostics to qflist" })

-- move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })

-- keep cursor position on `*`
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<CR>") -- remove whitespace below
vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor location on join" })

-- add whitespace
vim.keymap.set("n", "\\", "mzO<Esc>`z", { desc = "adds line above" })
vim.keymap.set("n", "|", "mzo<Esc>`z", { desc = "adds line below" })

-- page down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "up half page" })

-- next/prev match, center screen
vim.keymap.set("n", "n", "nzzzv", { desc = "next match, center screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous match, center screen" })

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to system clipboard" })

-- toggle wrap
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", { desc = "toggle word wrap" })

-- move around splits
-- vim.keymap.set("n", "<C-s>v", ":vsplit<Enter>", { desc = "split vertical" })
-- vim.keymap.set("n", "<C-s>h", ":split<Enter>", { desc = "split horizontal" })
-- vim.keymap.set("n", "<leader>sh", ":split<Enter>", { desc = "split horizontal" })
-- vim.keymap.set("n", "<leader>sv", ":vsplit<Enter>", { desc = "split vertical" })
-- vim.keymap.set("n", "<leader>sr", "<C-w>r", { desc = "rotate up/left" })
-- vim.keymap.set("n", "<leader>sR", "<C-w>R", { desc = "rotate down/right" })
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "make window shorter" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "make window taller" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "make window narrower" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "resize pane smaller vertical" })

-- Run Q Macro
vim.keymap.set("n", "Q", "@q")

-- buffers
vim.keymap.set("n", "H", "<cmd>bp<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "L", "<cmd>bn<CR>", { desc = "next buffer" })
vim.keymap.set("n", "X", "<cmd>bd<CR>", { desc = "close buffer" })

-- make current file executeable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make file executable" })

-- console.log selection
vim.keymap.set("v", "<leader>l", "yoconsole.log(\"pa:\", pa);", { desc = "console.log visual selection" })

-- add character to end of line
vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "add comma to end of line" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "add semicolon to end of line" })
