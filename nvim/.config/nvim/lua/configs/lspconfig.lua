-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = { "lua-language-server", "html", "cssls", "ts_ls", "clangd", "zls", "pyright", "asm_lsp", "jdtls", "gopls" }
vim.lsp.enable(servers)

-- require("lspconfig").lua_ls.setup({
-- 	settings = {
-- 		Lua = {
-- 			runtime = {
-- 				version = "LuaJIT",
-- 			},
-- 			diagnostics = {
-- 				globals = { "love" }, -- 🔥 THIS fixes undefined 'love'
-- 			},
-- 			workspace = {
-- 				library = {
-- 					vim.env.VIMRUNTIME,
-- 					"~/.local/share/love2d-library",
-- 				},
-- 				checkThirdParty = false,
-- 			},
-- 			telemetry = { enable = false },
-- 		},
-- 	},
-- })
