local sbar = require("sketchybar")
local settings = require("settings")
local colors = require("colors")

local cal = sbar.add("item", {
	icon = {
		color = colors.white,
		padding_left = 8,
		padding_right = 8,
		font = {
			style = settings.font.style_map["Heavy"],
			size = 14.0,
		},
	},
	label = {
		color = colors.white,
		width = 49,
		align = "right",
		font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 30,
	padding_right = 1,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(_)
	cal:set({ icon = os.date("%a %d. %b"), label = os.date("%H:%M") })
end)
