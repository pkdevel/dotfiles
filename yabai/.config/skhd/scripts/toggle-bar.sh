#!/bin/sh
if [ $(sketchybar --query bar |jq -r .hidden) = "off" ]; then
  yabai -m config external_bar off:40:0 &
  sleep 0.1
  sketchybar --bar hidden=toggle
else
  yabai -m config external_bar all:40:0
  sketchybar --bar hidden=toggle
fi

