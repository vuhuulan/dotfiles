#!/bin/sh
# change brightness of the screen, prevent going overboard.
# take binary input either "up" or "down".

UPPERLIMIT=1.0
LOWERLIMIT=0.1
STEP=0.1
CURRENT_BRIGHTNESS=$(xrandr --verbose | grep -m 1 -i brightness | cut -f2 -d " ")

if [ "$1" == "up" ] && [ $( echo "$CURRENT_BRIGHTNESS < $UPPERLIMIT" | bc ) -eq 1 ]; then
    CURRENT_BRIGHTNESS=$(echo $CURRENT_BRIGHTNESS + $STEP | bc)
elif [ "$1" == "down" ] && [ $( echo "$CURRENT_BRIGHTNESS > $LOWERLIMIT" | bc ) -eq 1 ]; then
    CURRENT_BRIGHTNESS=$(echo $CURRENT_BRIGHTNESS - $STEP | bc)
else
    :
fi

xrandr --output eDP-1 --brightness $CURRENT_BRIGHTNESS
