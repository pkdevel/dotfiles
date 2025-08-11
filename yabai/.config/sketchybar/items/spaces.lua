local sbar = require("sketchybar")
local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}
local spaceNames = {}

for i = 1, 10, 1 do
	local space = sbar.add("space", "space." .. i, {
		space = i,
		icon = {
			font = {
				family = settings.font.numbers,
				size = 18.0,
			},
			string = i,
			padding_left = 10,
			color = colors.white,
			highlight_color = colors.orange,
			y_offset = 1,
		},
		label = {
			padding_right = 15,
			color = colors.grey,
			highlight_color = colors.white,
			font = "sketchybar-app-font:Regular:18.0",
			y_offset = -2,
		},
		background = {
			height = 20,
			corner_radius = 5,
		},
		padding_left = 2,
		padding_right = 2,
	})

	spaces[i] = space
	spaceNames[i] = space.name

	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		space:set({
			icon = { highlight = selected },
			label = { highlight = selected },
			background = { color = selected and colors.bg2 or colors.bg1 },
		})
	end)

	space:subscribe("mouse.clicked", function(env)
		if env.BUTTON == "left" then
			sbar.exec("yabai -m space --focus " .. env.SID)
		end
	end)
end

sbar.add("bracket", "space", spaceNames, {
	background = {
		color = colors.bg1,
		height = 22,
		corner_radius = 5,
	},
})

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

space_window_observer:subscribe("space_windows_change", function(env)
	local icon_line = ""
	local no_app = true
	for app, _ in pairs(env.INFO.apps) do
		no_app = false
		local lookup = app_icons[app]
		local icon = ((lookup == nil) and app_icons["default"] or lookup)
		icon_line = icon_line .. " " .. icon
	end

	if no_app then
		icon_line = " —"
	end
	sbar.animate("tanh", 10, function()
		spaces[env.INFO.space]:set({ label = icon_line })
	end)
end)
