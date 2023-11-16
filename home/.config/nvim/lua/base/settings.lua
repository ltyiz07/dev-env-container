-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
local home_dir = os.getenv("HOME") or os.getenv("UserProfile")
vim.opt.undodir = home_dir .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "auto"
vim.api.nvim_set_hl(0, 'LineNr', { fg='black' })
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.clipboard = "unnamedplus"

vim.useSystemClipboard = true