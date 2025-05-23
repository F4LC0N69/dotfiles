require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

--toggle transparency
map(
	"n",
	"<leader>tt",
	":lua require('base46').toggle_transparency()<CR>",
	{ noremap = true, silent = true, desc = "Toggle Background Transparency" }
)
--python shit
map("n", "<leader>dpr", function()
	require("dap-python").test_method()
end, { desc = "Debug python run" })

local coderunner = require("configs.coderunner")
map("n", "<F5>", coderunner.run_code, { noremap = true, silent = true, desc = "Run Code" })
map("n", "\\", coderunner.run_code, { noremap = true, silent = true, desc = "Run Code" })

map({ "n", "t" }, "<F3>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { noremap = true, silent = true, desc = "Floating terminal" })

map("v", "<leader>sc", "<cmd>lua require'nvim-silicon'.clip()<CR>", { desc = "Copy code screenshot to clipboard" })
map("v", "<leader>sf", "<cmd>lua require'nvim-silicon'.file()<CR>", { desc = "Save code screenshot as file" })
map("v", "<leader>ss", "<cmd>lua require'nvim-silicon'.shoot()<CR>", { desc = "Create code screenshot." })
