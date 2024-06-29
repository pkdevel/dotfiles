local settings = require("settings")
local app_icons = require("helpers.app_icons")

local front_app = sbar.add("item", "front_app", {
  display = "active",
  icon = {
    font = "sketchybar-app-font:Regular:18.0",
    drawing = true,
  },
  label = {
    font = {
      style = settings.font.style_map["Black"],
      size = 15.0,
    },
  },
  position = "center",
  padding_right = 30,
  updates = true,
})

front_app:subscribe("front_app_switched", function(env)
  front_app:set({
    label = { string = env.INFO },
    icon = app_icons[env.INFO],
  })
end)
