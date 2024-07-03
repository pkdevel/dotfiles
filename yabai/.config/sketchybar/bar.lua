local sbar = require("sketchybar")
local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 24,
	y_offset = 0,
	color = colors.bar.bg,
	padding_right = 18,
	padding_left = 18,
	margin = 0,
	shadow = false,
})
