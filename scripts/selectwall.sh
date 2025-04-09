#!/bin/bash

WALLPAPER_DIR="$HOME/dotfiles/wallpapers"
LAST_WALL="$HOME/.cache/last_wallpaper"
PREVIEW_PID=""

# Ensure swww is running
pgrep -x swww-daemon > /dev/null || swww-daemon & sleep 0.5

# Get list of images
WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | sort)

# Preview function using imv
preview_wallpaper() {
    pkill -f "imv" 2>/dev/null
    imv "$1" &
    PREVIEW_PID=$!
}

# Let user select wallpaper
SELECTED=$(echo "$WALLPAPERS" | while read -r img; do
    echo "$img"
done | wofi --dmenu --prompt "Preview & Select Wallpaper:")

# If a wallpaper was selected
if [ -n "$SELECTED" ]; then
    pkill -f "imv" 2>/dev/null
    swww img "$SELECTED" --transition-type any --transition-duration 1
    echo "$SELECTED" > "$LAST_WALL"
else
    pkill -f "imv" 2>/dev/null
fi

