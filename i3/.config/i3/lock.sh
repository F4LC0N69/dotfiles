#!/bin/bash

# Colors - Catppuccin Mocha Palette
background=#1e1e2e
ring=#89b4fa
ring-verifying=#a6e3a1
ring-wrong=#f38ba8
keyhl=#cdd6f4
bshl=#f5c2e7
separator=#45475a
inside=#1e1e2e
inside-verifying=#a6e3a1
inside-wrong=#f38ba8
text=#cdd6f4
text-verifying=#cdd6f4
text-wrong=#f38ba8

# Lock the screen
i3lock \
    --inside-color=$inside     \
    --ring-color=$ring         \
    --line-uses-inside         \
    --keyhl-color=$keyhl       \
    --bshl-color=$bshl         \
    --separator-color=$separator \
    --insidever-color=$inside-verifying \
    --ringver-color=$ring-verifying \
    --insidewrong-color=$inside-wrong \
    --ringwrong-color=$ring-wrong \
    --verif-color=$text-verifying \
    --wrong-color=$text-wrong \
    --time-color=$text \
    --date-color=$text \
    --layout-color=$text \
    --screen 1 \
    --clock \
    --indicator \
    --time-str="%H:%M:%S" \
    --date-str="%A, %d %B %Y" \
    --time-font="CaskaydiaCove Nerd Font" \
    --date-font="CaskaydiaCove Nerd Font" \
    --radius=120 \
    --ring-width=10
