#!/bin/bash

# 1. Set the wallpaper (Assuming you use swww, adjust if using hyprpaper)
tw="/home/rui/Pictures/wallpaper/king.jpg"
awww img "$tw" --transition-type grow --transition-pos 0.5,0.5

# 2. Run pywal16 to generate the 16-color palette
wal -i "$tw" --cols16

# 3. Reload running GTK apps (optional, but helps force a live-refresh)
# Toggling the color scheme quickly flushes the GTK CSS cache
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
sleep 0.1
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

echo "Theme successfully updated to match $1!"
