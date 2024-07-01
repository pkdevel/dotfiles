local sbar = require("sketchybar")
local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "network_update"
-- for the network interface "en9", which is fired every 2.0 seconds.
sbar.exec(
	"killall network_load >/dev/null; $CONFIG_DIR/helpers/event_providers/network_load/bin/network_load en9 network_update_wired 2.0"
)

local popup_width = 250

local ethernet_up = sbar.add("item", "widgets.ethernet1", {
	position = "right",
	padding_left = -5,
	width = 0,
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
		string = icons.ethernet.upload,
	},
	label = {
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
		color = colors.red,
		string = "??? Bps",
	},
	y_offset = 6,
})

local ethernet_down = sbar.add("item", "widgets.ethernet2", {
	position = "right",
	padding_left = -5,
	icon = {
		padding_right = 0,
		font = {
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
		string = icons.ethernet.download,
	},
	label = {
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 12.0,
		},
		color = colors.green,
		string = "??? Bps",
	},
	y_offset = -6,
})

local ethernet = sbar.add("item", "widgets.ethernet.padding", {
	position = "right",
	label = { drawing = false },
})

-- Background around the item
local ethernet_bracket = sbar.add("bracket", "widgets.ethernet.bracket", {
	ethernet.name,
	ethernet_up.name,
	ethernet_down.name,
}, {
	background = { color = colors.bg1 },
	popup = { align = "center", height = 30 },
})

local hostname = sbar.add("item", {
	position = "popup." .. ethernet_bracket.name,
	icon = {
		align = "left",
		string = "Hostname:",
		width = popup_width / 2,
	},
	label = {
		max_chars = 20,
		string = "????????????",
		width = popup_width / 2,
		align = "right",
	},
})

local ip = sbar.add("item", {
	position = "popup." .. ethernet_bracket.name,
	icon = {
		align = "left",
		string = "IP:",
		width = popup_width / 2,
	},
	label = {
		string = "???.???.???.???",
		width = popup_width / 2,
		align = "right",
	},
})

local mask = sbar.add("item", {
	position = "popup." .. ethernet_bracket.name,
	icon = {
		align = "left",
		string = "Subnet mask:",
		width = popup_width / 2,
	},
	label = {
		string = "???.???.???.???",
		width = popup_width / 2,
		align = "right",
	},
})

local router = sbar.add("item", {
	position = "popup." .. ethernet_bracket.name,
	icon = {
		align = "left",
		string = "Router:",
		width = popup_width / 2,
	},
	label = {
		string = "???.???.???.???",
		width = popup_width / 2,
		align = "right",
	},
})

sbar.add("item", { position = "right", width = settings.group_paddings })

ethernet_up:subscribe("network_update_wired", function(env)
	local up_color = (env.upload == "000 Bps") and colors.grey or colors.red
	local down_color = (env.download == "000 Bps") and colors.grey or colors.green
	ethernet_up:set({
		icon = { color = up_color },
		label = {
			string = env.upload,
			color = up_color,
		},
	})
	ethernet_down:set({
		icon = { color = down_color },
		label = {
			string = env.download,
			color = down_color,
		},
	})
end)

ethernet:subscribe({ "wifi_change", "system_woke" }, function(_)
	sbar.exec("ipconfig getifaddr en9", function(ipaddr)
		local connected = not (ipaddr == "")
		ethernet:set({
			icon = {
				string = connected and icons.ethernet.connected or icons.ethernet.disconnected,
				color = connected and colors.white or colors.red,
			},
		})
	end)
end)

local function hide_details()
	ethernet_bracket:set({ popup = { drawing = false } })
end

local function toggle_details()
	local should_draw = ethernet_bracket:query().popup.drawing == "off"
	if should_draw then
		ethernet_bracket:set({ popup = { drawing = true } })
		sbar.exec("networksetup -getcomputername", function(result)
			hostname:set({ label = result })
		end)
		sbar.exec("ipconfig getifaddr en9", function(result)
			ip:set({ label = result })
		end)
		sbar.exec(
			"networksetup -getinfo 'Thunderbolt Ethernet Slot 0' | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'",
			function(result)
				mask:set({ label = result })
			end
		)
		sbar.exec(
			"networksetup -getinfo 'Thunderbolt Ethernet Slot 0' | awk -F 'Router: ' '/^Router: / {print $2}'",
			function(result)
				router:set({ label = result })
			end
		)
	else
		hide_details()
	end
end

ethernet_up:subscribe("mouse.clicked", toggle_details)
ethernet_down:subscribe("mouse.clicked", toggle_details)
ethernet:subscribe("mouse.clicked", toggle_details)
ethernet:subscribe("mouse.exited.global", hide_details)

local function copy_label_to_clipboard(env)
	local label = sbar.query(env.NAME).label.value
	sbar.exec('echo "' .. label .. '" | pbcopy')
	sbar.set(env.NAME, { label = { string = icons.clipboard, align = "center" } })
	sbar.delay(1, function()
		sbar.set(env.NAME, { label = { string = label, align = "right" } })
	end)
end

hostname:subscribe("mouse.clicked", copy_label_to_clipboard)
ip:subscribe("mouse.clicked", copy_label_to_clipboard)
mask:subscribe("mouse.clicked", copy_label_to_clipboard)
router:subscribe("mouse.clicked", copy_label_to_clipboard)
