#!/bin/bash
#  ____                               _           _
# / ___|  ___ _ __ ___  ___ _ __  ___| |__   ___ | |_
# \___ \ / __| '__/ _ \/ _ \ '_ \/ __| '_ \ / _ \| __|
#  ___) | (__| | |  __/  __/ | | \__ \ | | | (_) | |_
# |____/ \___|_|  \___|\___|_| |_|___/_| |_|\___/ \__|
#
#
# by Stephan Raabe (2023)
# -----------------------------------------------------

DIR="$HOME/Pictures/screenshots/"
NAME="screenshot_$(date +%d%m%Y_%H%M%S).png"

option2="Selected area"
option3="Fullscreen (delay 3 sec)"

options="$option2\n$option3"

choice=$(echo -e "$options" | rofi -dmenu -replace -config ~/dotfiles/rofi/config-screenshot.rasi -i -no-show-icons -l 2 -width 30 -p "Take Screenshot")

case $choice in
$option2)
  grim -g "$(slurp)" "$DIR$NAME"
  wl-copy -t image/png <"$DIR$NAME"
  notify-send "Screenshot created and copied to clipboard" "Mode: Selected area"
  swappy -f "$DIR$NAME"
  ;;
$option3)
  sleep 3
  grim "$DIR$NAME"
  wl-copy -t image/png <"$DIR$NAME"
  notify-send "Screenshot created and copied to clipboard" "Mode: Fullscreen"
  swappy -f "$DIR$NAME"
  ;;
esac
