local vim = vim
local leap = require("leap")

leap.opts.case_sensitive = false
leap.opts.special_keys = {
	next_target = "<enter>",
	prev_target = "<tab>",
	next_group = "<space>",
	prev_group = "<tab>",
	multi_accept = "<enter>",
	multi_revert = "<backspace>",
}

vim.keymap.set("n", "<leader>j", function()
	local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
		return vim.api.nvim_win_get_config(win).focusable
	end, vim.api.nvim_tabpage_list_wins(0))
	require("leap").leap({ target_windows = focusable_windows_on_tabpage })
end)

vim.keymap.set("n", "<leader>l", function()
	local focusable_windows_on_tabpage = vim.tbl_filter(function(win)
		return vim.api.nvim_win_get_config(win).focusable
	end, vim.api.nvim_tabpage_list_wins(0))
	require("leap").leap({ target_windows = focusable_windows_on_tabpage })
end)
