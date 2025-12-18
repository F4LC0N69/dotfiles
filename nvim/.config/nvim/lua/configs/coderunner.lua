-- lua/configs/coderunner.lua
local M = {}

M.run_code = function()
	-- Save current file
	vim.cmd("w")

	-- Launch floating terminal
	require("nvchad.term").toggle({
		id = "floatTerm",
		pos = "float",
		cmd = function()
			local file = vim.fn.expand("%") -- full file path
			local dir = vim.fn.fnamemodify(file, ":h") -- file directory
			local ft = vim.bo.ft -- filetype

			-- Post-run: pause and exit
			local post_run = " && echo '\n[Press any key to exit]' && read -n 1 && exit"

			-- Filetype commands
			local runners = {
				python = "clear && python3 " .. file,
				lua = "clear && lua " .. file,
				c = "clear && gcc -o out " .. file .. " && ./out",
				cpp = "clear && g++ -o out " .. file .. " && ./out",
				go = "clear && go run " .. file,
				rust = "cd " .. vim.fn.shellescape(dir) .. " && clear && cargo run",
				zig = "clear && zig run " .. file,
				java = "clear && javac " .. file .. " && java " .. vim.fn.fnamemodify(file, ":t:r"),
				javascript = "clear && node " .. file,
				typescript = "clear && ts-node " .. file,
				sh = "clear && bash " .. file,
			}

			local cmd = runners[ft]
			if not cmd then
				cmd = "echo 'No runner found for filetype: " .. ft .. "'"
			end

			return cmd .. post_run
		end,
	})
end

return M
