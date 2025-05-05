#!/bin/sh

[-e /tmp/screen_locked*.png] && rm /tmp/screen_locked*.png
scrot /tmp/screen_locked.png
convert /tmp/screen_locked.png -paint 3 /tmp/screen_locked.png
i3lock -i /tmp/screen_locked.png
