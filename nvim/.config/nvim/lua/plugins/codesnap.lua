return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		local home = os.getenv("HOME")
		require("nvim-silicon").setup({
			font = "CaskaydiaCoveNerdFont=20",
			theme = home .. "/dotfiles/bat/.config/bat/themes/catppuccin-mocha.tmtheme",
			output = function()
				local timestamp = os.date("%Y-%m-%d_%H-%M-%S")
				return string.format("%s/Pictures/Codesnaps/snap_%s.png", home, timestamp)
			end,
			background = "#1e1e2e",
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
			to_clipboard = true,
		})
	end,
}
