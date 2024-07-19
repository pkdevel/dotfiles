local wezterm = require("wezterm")
return {
	default_prog = { "/bin/zsh", "-l", "-c", 'tmux new -A -s "🚀 copium "' },
	color_scheme = "Tokyo Night Storm",
	enable_tab_bar = false,
	font_size = 14.0,
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Medium" }),
	macos_window_background_blur = 30,
	window_background_opacity = 0.9,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_close_confirmation = "NeverPrompt",
}
