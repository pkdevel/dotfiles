local sbar = require("sketchybar")
local icons = require("icons")

sbar.add("item", {
	icon = { string = icons.apple },
	label = { drawing = false },
	padding_left = 0,
	padding_right = 10,
})
