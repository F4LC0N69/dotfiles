return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
	},
}
