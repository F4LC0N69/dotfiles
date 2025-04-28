local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE", --disable title bar but enables to resize windows
	default_cursor_style = "BlinkingBar",
	color_scheme = "Catppuccin Mocha",
	font_size = 24,
	enable_kitty_graphics = true,
	window_background_opacity = 0.9,
	macos_window_background_blur = 70,
	font = wezterm.font_with_fallback({
		--'CaskaydiaCove NF',
		"JetBrains Mono",
	}),
}
return config
