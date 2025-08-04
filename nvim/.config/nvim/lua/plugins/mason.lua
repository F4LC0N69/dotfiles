return {
	-- 	"williamboman/mason.nvim",
	-- 	config = function()
	-- 		require("mason").setup()
	-- 	end,
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"pyright",
	-- 			"prettierd",
	-- 			"eslint_d",
	-- 			"codelldb",
	-- 			"shellcheck",
	-- 			"ruff",
	-- 			"mypy",
	-- 			"debugpy",
	-- 		},
	-- 	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require("mason-nvim-dap").setup()
		end,
		opts = {
			ensure_installed = {
				"codelldb",
				"debugpy",
			},
		},
	},
}
