-- defind map method
function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- set leader key with: ;
vim.g.mapleader = ";";


-- open termianl with: :term
--      back to normalmode from isertmode at term with: <C-\><C-n>

-- toggle undotree with: leader + u
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- toggle nerd tree with: leader + n
map("n", "<A-1>", "<Cmd>NERDTreeToggle<CR>")
map("n", "<leader>n", "<Cmd>NERDTreeFind<CR>")
-- open vim file explorer with: leader + e
map("n", "<leader>e", "<Cmd>NERDTreeToggle<CR>")

-- change pane with: ctrl + {h, j, k, l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
-- change pane's size with: ctrl + {left, right, up, down}
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- close buffer with: ctrl + w
map("n", "<C-w>", "<Cmd>bd<CR>")
-- create new tab with: ctrl + n
map("n", "<C-n>", "<Cmd>tabnew<CR>")
-- chnage between tabs with: alt + {h, l}
map("n", "<A-l>", "gt")
map("n", "<A-h>", "gT")

-- change buffer with: alt + {j, k}
map("n", "<A-k>", "<Cmd>bprevious<CR>")
map("n", "<A-j>", "<Cmd>bnext<CR>")


-- split current pane left with: leader + [s]plit + [l]eft
map("n", "<leader>sl", "<Cmd>vert sb<CR>")
-- split current pane right with: leader + [s]plit + [r]ight
map("n", "<leader>sr", "<Cmd>vert belowright sb<CR><C-w>h")
-- split current pane up with: leader + [s]plit + [u]p
map("n", "<leader>su", "<Cmd>sb<CR>")
-- split current pane down with: leader + [s]plit + [d]own
map("n", "<leader>sd", "<Cmd>sb<CR><C-w>k")


-- save current file with: ctrl + s
map("n", "<C-s>", "<Cmd>w<CR>")
map("i", "<C-s>", "<Cmd>w<CR>")

-- undo with: ctrl + z
map("n", "<C-z>", "u")

-- select buffer window with: F4
map("n", "<F4>", "<Cmd>buffers<CR>:buffer<Space>")

-- settins for make file
map("n", "<F5>", "<Cmd>w<CR><Cmd>make<CR><Cmd>cope<CR><C-w>p")

map("n", "<leader>1", "1gt")
map("n", "<leader>2", "2gt")
map("n", "<leader>3", "3gt")
map("n", "<leader>4", "4gt")
map("n", "<leader>5", "5gt")
map("n", "<leader>6", "6gt")
map("n", "<leader>7", "7gt")
map("n", "<leader>8", "8gt")
map("n", "<leader>9", "9gt")
map("n", "<leader>0", ":tablast<cr>")

map("i", "<C-[>", "<Cmd>stopinsert<CR>")
