local sbar = require("sketchybar")

require("items.apple")
require("items.spaces")
require("items.front_app")
require("items.calendar")

sbar.add("alias", "TextInputMenuAgent,Item-0", {
	position = "right",
	padding_left = -10,
	padding_right = -10,
})
sbar.add("alias", "Stats", {
	position = "right",
	padding_right = -10,
})

require("items.media")
