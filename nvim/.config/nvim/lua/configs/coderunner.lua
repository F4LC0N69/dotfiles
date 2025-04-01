local M = {}

M.run_code = function()
	vim.cmd("w") --Save before running

	require("nvchad.term").toggle({
		id = float_term,
		pos = "float",
		cmd = function()
			local file = vim.fn.expand("%")
			local dir = vim.fn.fnamemodify(file, ":h")
			local ft_cmds = {
				python = "python3 " .. file,
				cpp = "clear && g++ -o out " .. file .. "&& ./out",
				c = "clear && gcc -o out " .. file .. "&& ./out",
				go = "go run " .. file,
				rust = "cd " .. vim.fn.shellescape(dir) .. "&& clear && cargo run",
				zig = "zig run " .. file,
			}
			return ft_cmds[vim.bo.ft] or echo("'No runner found for this file type.'")
		end,
	})
end
return M
