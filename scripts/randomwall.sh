#!/bin/bash

WALLPAPER_DIR="$HOME/dotfiles/wallpapers"
LAST_WALL="$HOME/.cache/last_wallpaper"

pgrep -x swww-daemon > /dev/null || swww-daemon & sleep 0.5

# Pick a random wallpaper
RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Set it
if [ -n "$RANDOM_WALL" ]; then
    swww img "$RANDOM_WALL" --transition-type any --transition-duration 1
    echo "$RANDOM_WALL" > "$LAST_WALL"
fi

