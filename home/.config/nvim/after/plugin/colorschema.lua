require("gruvbox").setup({
	overrides = {
		SignColumn = { bg = "#ff9900" },
	},
})
vim.cmd("colorscheme gruvbox")
vim.api.nvim_set_hl(0, "LineNr", { fg = "grey" })
