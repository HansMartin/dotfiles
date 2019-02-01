#!/bin/sh

case $BLOCK_BUTTON in
    1) notify-send "$(ps axch -o cmd:15,%mem --sort=-%mem | sed 11q)";;
    2) ;;
esac

free -h | awk '/^Mem:/ {print $3}'
