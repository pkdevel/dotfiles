local sbar = require("sketchybar")
local icons = require("icons")

sbar.add("item", {
	icon = {
		font = { size = 16.0 },
		string = icons.apple,
		padding_left = 8,
		padding_right = 8,
	},
	label = { drawing = false },
	padding_left = 1,
	padding_right = 10,
})
