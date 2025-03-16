#!/bin/sh

cp -r eww rofi ~/.config
# cp -r rofi ~/.config
cp .Xresources .xprofile ~/
chmod +x scripts/run.sh scripts/chadwm-help || exit 1
sudo cp scripts/run.sh /usr/local/bin/chadwm-start || exit 1
sudo cp scripts/chadwm-help /usr/local/bin/chadwm-help || exit 1
./scripts/dwm-cheatsheet.py chadwm/config.def.h CHEATSHEET.md || exit 1
sudo apt install dash libimlib2-dev picom feh acpi rofi flameshot || exit 1

# sudo apt install cargo rustc || exit 1

cd chadwm && make clean && sudo make install || exit 1
