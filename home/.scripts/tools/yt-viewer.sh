#!/bin/sh

url=$(xclip -o)

ch="$(printf "yes\nno" | dmenu -p "Play $url?")"

if [ $ch = "yes" ];
then
    mpv $url &
fi
