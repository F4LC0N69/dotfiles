return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	config = function()
		require("nvim-silicon").setup({
			font = "JetBrainsMonoNerdFontMono=18; Noto Color Emoji=18; Noto Emoji=17", --😆
			theme = "/Users/saxam/dotfiles/bat/.config/bat/themes/Catppuccin Mocha.tmTheme",
			output = function()
				local timestamp = os.date("%Y-%m-%d_%H-%M-%S")
				return string.format("/Users/saxam/Pictures/Codesnaps/snap_%s.png", timestamp)
			end,
			background = "#1e1e2e",
			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
			end,
			to_clipboard = true,
		})
	end,
}
--😎
