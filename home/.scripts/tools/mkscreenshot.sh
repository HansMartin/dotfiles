#!/bin/sh

sspath="$HOME/pictures/screenshots"
tmpss="/tmp/tmp_mkscreenshot.png"

choice=$(printf "Select\nFull Screen\nActive Window" | dmenu -i)


save_screenshot () {
    # copy screenshot as image to clipboard (pasting in Telegram, ...)
    xclip -t image/png -selection clipboard -i < "$tmpss"

    name=$(echo '' | dmenu -p "Enter Name:")

    if [ "$name" = "" ]; then
        echo '[-] Aborting...'
        exit 0
    fi

    mv "$tmpss" "$sspath/$name.png"
    notify-send "screenshot has been saved in ~/pictures/screenshots"

}

# Choice between Full Screen, Active Window and Selection
if [ "$choice" = "Select" ]
then
    notify-send "select an area for the screenshot"
    scrot -s $tmpss
    if [ $? -eq 0 ]; then
        save_screenshot
    fi
elif [ "$choice" = "Full Screen" ]
then
    scrot $tmpss
    if [ $? -eq 0 ]; then
        save_screenshot
    fi
elif [ "$choice" = "Active Window" ]
then
    scrot -u $tmpss
    if [ $? -eq 0 ]; then
        save_screenshot
    fi
fi



