#!/bin/bash

declare -A power_opts=(
    [Lock]='bash lock.sh'
    [Suspend]='systemctl suspend'
    [Poweroff]=poweroff
)

prompt=$(echo ${!power_opts[@]} | sed 's/ /\n/g' | dmenu -i -p "What do you want to do?")
${power_opts[$prompt]}
