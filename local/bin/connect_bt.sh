#/bin/bash

ALIAS=$(echo $(bluetoothctl paired-devices) |\
    sed 's/Device\|[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}:[0-9A-Fa-f]\{2\}//g' |\
    sed 's/^  //g' |\
    sed 's/   /\n/g' |\
    dmenu -i -fn 'Hack Nerd Font:pixelsize=16' -p 'What devices do you want to connect?')

bluetoothctl connect `bluetoothctl devices | grep $ALIAS | cut -d ' ' -f 2`
