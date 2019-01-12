#!/bin/bash
# script from: https://github.com/savoca/dotfiles/blob/gray/home/.bin/scripts/lock.sh
# More Input @ https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/

if [ ! -z $1 ] && [ -f $1 ]; then
    # file is given as input & file exists
    cp $1 /tmp/screen.png
else
    scrot /tmp/screen.png
fi

convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png $HOME/.scripts/i3/lock.png -gravity center -composite -matte /tmp/screen.png

# stolen from https://github.com/pavanjadhaw/betterlockscreen/blob/master/betterlockscreen
letterEnteredColor=d23c3dff
letterRemovedColor=d23c3dff
passwordCorrect=00000000
passwordIncorrect=d23c3dff
background=00000000
foreground=ffffffff
i3lock \
        -t -i "/tmp/screen.png" \
        --timepos="x+110:h-70" \
        --datepos="x+135:h-45" \
        --clock --datestr "Type password to unlock..." \
        --insidecolor=$background --ringcolor=$foreground --line-uses-inside \
        --keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
        --insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
        --ringvercolor=$foreground --ringwrongcolor=$foreground --indpos="x+280:h-70" \
        --radius=20 --ring-width=4 --veriftext="" --wrongtext="" \
        --verifcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
        --noinputtext="" --force-clock $lockargs

rm /tmp/screen.png

