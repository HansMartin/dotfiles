#!/bin/sh
playlist=$HOME/.scripts/misc/playlist.txt

url=$(xclip -o)

choice=$(/usr/bin/cat $playlist | awk -F~ '{print $2}' | dmenu -i)

mpv $(cat $playlist | grep "$choice" | awk -F~ '{print $1}')




