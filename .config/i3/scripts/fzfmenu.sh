#/usr/bin/bash

xfce4-terminal --minimize --hide-menubar --hide-borders -e "fzf";
i3-msg floating enable > /dev/null;
i3-msg move position center > /dev/null;
