local map = require("base.utils.mapper").map

-- toggle nerd tree with: leader + n
map("n", "<A-1>", "<Cmd>NERDTreeToggle<CR>")

map("n", "<leader>n", "<Cmd>NERDTreeFind<CR>")

-- open vim file explorer with: leader + e
map("n", "<leader>e", "<Cmd>NERDTreeToggle<CR>")

vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeWinPos = "right"
