local M = {}

M.run_code = function()
	vim.cmd("w") --Save before running

	require("nvchad.term").toggle({
		id = "floatTerm",
		pos = "float",
		cmd = function()
			local file = vim.fn.expand("%")
			local dir = vim.fn.fnamemodify(file, ":h")
			local post_run = "&& sleep 0.1 && echo 'Press any key to exit' && read -n 1 && exit"
			local ft_cmds = {
				python = "python3 " .. file,
				lua = "lua " .. file,
				cpp = "clear && g++ -o out " .. file .. "&& ./out",
				c = "clear && gcc -o out " .. file .. "&& ./out",
				go = "go run " .. file,
				rust = "cd " .. vim.fn.shellescape(dir) .. "&& clear && cargo run",
				zig = "zig run " .. file,
			}

			local final_cmds = {}
			for ft, cmd in pairs(ft_cmds) do
				final_cmds[ft] = cmd .. post_run
			end
			return final_cmds[vim.bo.ft]
				or ("echo 'No runner found for filetype: " .. vim.bo.filetype .. "'" .. post_run)
		end,
	})
end

return M
