#!/bin/sh

xrdb merge ~/.Xresources
xbacklight -set 10 &
feh --bg-fill ~/Images/dwmwp.png &
xset r rate 200 50 &
picom &

# Temporary Bypass to use yazi filechooser
XDG_CURRENT_DESKTOP=gnome /usr/libexec/xdg-desktop-portal -r &

dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
