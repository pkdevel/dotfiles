local colors = require("colors")
local icons = require("icons")

sbar.add("item", {
	icon = {
		font = { size = 16.0 },
		string = icons.apple,
		padding_right = 8,
		padding_left = 8,
	},
	label = { drawing = false },
	background = {
		color = colors.bg1,
		border_color = colors.bg2,
		border_width = 1,
	},
	padding_left = 1,
	padding_right = 10,
})
