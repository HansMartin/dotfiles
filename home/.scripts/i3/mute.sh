#!/bin/bash
# get current volume
vol=$(amixer -D pulse sget Master)
echo $vol

