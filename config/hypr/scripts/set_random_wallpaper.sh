WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
RANDOM_WALLPAPER=$(doas find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.gif -o -iname \*.webm \) | shuf -n 1)
swww img -t center "$RANDOM_WALLPAPER"
