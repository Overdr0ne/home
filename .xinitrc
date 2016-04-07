#!/bin/bash
sh ~/.fehbg &
unclutter &
eval `pidof ssh-agent`
#xmodmap ~/.Xmodmap
#xbindkeys &
xrdb ~/.Xresources
#setxkbmap -option ctrl:swapcaps
exec i3
