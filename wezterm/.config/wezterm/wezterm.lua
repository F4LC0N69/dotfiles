local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
  automatically_reload_config = true,
  enable_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE", --disable title bar but enables to resize windows
  default_cursor_style = "BlinkingBar",
  color_scheme = "Catppuccin Mocha",
  font_size = 18,
  enable_kitty_graphics = true,
}
return config
