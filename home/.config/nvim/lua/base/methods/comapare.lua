--lua local lines = vim.fn.getline(1, 10); print(table.concat(lines, '\n'))

local M = {}

function M.compare_clipboard()
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")
	local line_start = vstart[2]
	local line_end = vend[2]
	-- or use api.nvim_buf_get_lines
	--local lines = vim.fn.getline(line_start, line_end)
	local lines = vim.fn.getline(line_start, line_end)
	print(table.concat(lines, "\n"))
end
return M
