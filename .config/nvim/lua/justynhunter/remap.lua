vim.g.mapleader = " "

-- netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- add blank line
vim.keymap.set("n", "<C-CR>", "o<ESC>k", { desc = "add blank line below" })

-- search
vim.keymap.set("n", "<leader>/", "<cmd>nohlsearch<CR>", { desc = "clear search" })

--quickfix list
-- vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
-- vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })
vim.keymap.set("n", "<leader>q", "<cmd>copen<CR>", { desc = "open quickfix list" })
vim.keymap.set("n", "<leader>Q", "<cmd>ccl<CR>", { desc = "close quickfix list" })
vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.setqflist()<CR><cmd>copen<CR>",
    { desc = "send diagnostics to qflist" })

-- fix indenting
vim.keymap.set("n", "<leader>i", "gg=G``", { desc = "fix indenting" })

-- move line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move line up" })

-- keep cursor position on `*`
vim.keymap.set("n", "*", ":keepjumps normal! mi*`i<CR>")
-- remove whitespace below
vim.keymap.set("n", "dJ", "mzJ`z", { desc = "remove whitespace below" })

-- page down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "down 5 lines" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "upd 5 lines" })

-- next/prev match, center screen
vim.keymap.set("n", "n", "nzzzv", { desc = "next match, center screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous match, center screen" })

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- toggle wrap
vim.keymap.set("n", "<leader>w", "<cmd>set wrap!<CR>", { desc = "toggle word wrap" })

-- move around splits
vim.keymap.set("n", "<leader>sh", ":split<Enter>", { desc = "split horizontal" })
vim.keymap.set("n", "<leader>sv", ":vsplit<Enter>", { desc = "split vertical" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "move to left pane" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "move to right pane" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "move to up pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "move to down pane" })

-- unmap
vim.keymap.set("n", "Q", "<nop>")

-- replace all under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make executeable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make file executable" })

-- swap buffers
vim.keymap.set("n", "ss", "<cmd>e #<CR>")
