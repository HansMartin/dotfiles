#!/bin/sh

case $BLOCK_BUTTON in
    1) notify-send "$(ps axch -o cmd:15,%cpu --sort=-%cpu | sed 11q)";;
    2) ;;
esac

grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}'
