#!/bin/bash

# file path to control backlight
kbd_backlight="/sys/class/leds/tpacpi::kbd_backlight/brightness"

# read current brightness
current_brightness=$(cat "$kbd_backlight")

# cycle brightness: 0 -> 1 -> 2 -> 0
next_brightness=$(( (current_brightness + 1) % 3 ))

# set the new brightness
echo "$next_brightness" | doas tee "$kbd_backlight"

