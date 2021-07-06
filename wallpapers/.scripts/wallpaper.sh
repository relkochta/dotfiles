#!/bin/bash
WALLPAPER="$(find ~/.config/wallpapers -type f -name *.png -o -name *.jpg -o -name *.jpeg | shuf -n 1)"
gsettings set org.gnome.desktop.background picture-uri "file:///$WALLPAPER"
