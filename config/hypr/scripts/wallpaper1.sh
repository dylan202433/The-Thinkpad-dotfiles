#!/bin/bash

# Directory for all wallpapers
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"

# Special wallpaper naming pattern (you can change these)
SPECIAL_WALLPAPER_1="arch_chan_special.jpg"    # 1-in-100 chance
SPECIAL_WALLPAPER_2="super_rare_special.jpg"   # 1-in-10,000 chance

# Get a list of all image files in the directory (exclude directories)
ALL_WALLPAPERS=($(find "$WALLPAPER_DIR" -maxdepth 1 -type f -iregex ".*\.\(jpg\|png\|jpeg\)"))

# Random number for rarity checks
RANDOM_CHANCE=$((RANDOM % 10000))  # This will range from 0 to 9999

# Debug info
echo "Random chance: $RANDOM_CHANCE"

if (( RANDOM_CHANCE == 0 )); then
    # 1-in-10,000 chance for the super rare wallpaper
    SELECTED_WALLPAPER="$WALLPAPER_DIR/$SPECIAL_WALLPAPER_2"
elif (( RANDOM_CHANCE < 100 )); then
    # 1-in-100 chance for the regular special wallpaper
    SELECTED_WALLPAPER="$WALLPAPER_DIR/$SPECIAL_WALLPAPER_1"
else
    # Randomly select a wallpaper from all available wallpapers
    SELECTED_WALLPAPER="${ALL_WALLPAPERS[RANDOM % ${#ALL_WALLPAPERS[@]}]}"
    
    # If the selected wallpaper is a special one, try again
    while [[ "$SELECTED_WALLPAPER" == *"_special.jpg" ]]; do
        SELECTED_WALLPAPER="${ALL_WALLPAPERS[RANDOM % ${#ALL_WALLPAPERS[@]}]}"
    done
fi

echo "Selected wallpaper: $SELECTED_WALLPAPER"

# Set the wallpaper using swww
swww img -t any "$SELECTED_WALLPAPER"
wal -i "$SELECTED_WALLPAPER"
