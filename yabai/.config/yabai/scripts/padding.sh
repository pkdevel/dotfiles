#!/bin/bash

# find total number of windows on current space that are not floating, not sticky, not minimized, but are visible.
TOTAL="$(yabai -m query --windows --space | jq '.[] | select(."is-floating" == false) | select(."is-sticky" == false) | select(."is-visible" == true) | select(."is-minimized" == false)' | jq --slurp '. | length')"

# find the padding ammount on the current space
CURRENT=$(yabai -m config --space $(yabai -m query --spaces --space | jq '(."index")') window_gap)

# if the total is greater than 1, set padding, else disable padding.
if [[ $TOTAL -gt 1 ]]; then
  if [[ $CURRENT -eq 0 ]]; then
    yabai -m space --gap abs:20
    yabai -m space --padding abs:20:16:18:18
  fi
else
  if [[ $CURRENT -ne 0 ]]; then
    yabai -m space --gap abs:0
    yabai -m space --padding abs:0:0:0:0
  fi
fi
