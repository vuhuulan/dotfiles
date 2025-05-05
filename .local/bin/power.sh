#!/bin/bash

declare -A power_opts=(
    [Lock]='bash lock.sh'
    [Suspend]='systemctl suspend'
    [Poweroff]='poweroff'
    [Reboot]='reboot'
    [Logout]='i3-msg exit'
)

prompt=$(echo ${!power_opts[@]} | sed 's/ /\n/g' | dmenu -i -fn 'Hack Nerd Font:pixelsize=16' -p "What do you want to do?")
${power_opts[$prompt]}
