#!/bin/sh
# A dmenu binary prompt script.
# Gives a dmenu prompt labeled with $1 to perform command $2.
# For example:
# `./prompt 'Do you want to shutdown?' 'poweroff'`

choice=$(printf "No\nYes" | dmenu -i -p "$1")
if [ "$choice" = "Yes" ]; then
  sh -c "$2"
fi
