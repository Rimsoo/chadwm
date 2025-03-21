#!/bin/bash

# Mode principal
show_menu() {
  echo -e "  Power\n  Volume\n Calendar"
}

# Sous-menu Power
power_options() {
  echo -e " Shutdown\n Reboot\n Logout\n⏾ Suspend"
}

volume() {
  current_vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -n1)
  selected=$(seq 0 10 100 | rofi -dmenu -p "Volume: $current_vol%")

  if [ -n "$selected" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ "$selected%"
  fi
}

case "$1" in
"power")
  action=$(power_options | rofi -dmenu -p "Power")
  case "$action" in
  " Shutdown") systemctl poweroff ;;
  " Reboot") systemctl reboot ;;
  " Logout") killall dwm || loginctl terminate-user $USER ;;
  "⏾ Suspend") systemctl suspend ;;
  esac
  ;;
"volume")
  # Script de gestion du volume (voir étape 3)
  volume
  ;;
"calendar")
  # Affichage du calendrier (voir étape 4)
  rofi -e "$(cal -3)"
  ;;
*)
  selection=$(show_menu | rofi -dmenu -p "Menu")
  case "$selection" in
  "  Power") chadwm-status-menu power ;;
  "  Volume") chadwm-status-menu volume ;;
  "  Calendar") chadwm-status-menu calendar ;;
  esac
  ;;
esac

# #!/usr/bin/env bash
#
# killall yad 2>/dev/null && exit 1
#
# yad --plug=$$ --calendar --tabnum=1 &>res1 &
#
# yad --paned \
#   --plug=$$ \
#   --tabnum=2 \
#   --form --columns=1 \
#   --field="Wifi:CHK" "TRUE" \
#   --field="Bluetooth:SW" "TRUE" \
#   --field="Volume:SCL" "50!0..100!1" \
#   --field="Luminosité:SCL" "75!0..100!1" &>res2 &
#
# yad --title="Control Center" \
#   --key=$$ \
#   --paned \
#   --orient=vert \
#   --undecorated \
#   --on-top \
#   --width=300 \
#   --height=300 \
#   --no-buttons \
#   --mouse \
#   --skip-taskbar \
#   --close-on-unfocus \
#   --borders=10 | while read -r line; do
#   # La sortie Yad sera un flux d’événements de type :
#   # 1|TRUE|FALSE|60|75
#   # 1|TRUE|FALSE|61|75
#   # ...
#   # On parse selon l’ordre des champs
#   wifi=$(echo "$line" | cut -d'|' -f2)
#   bluetooth=$(echo "$line" | cut -d'|' -f3)
#   volume=$(echo "$line" | cut -d'|' -f4)
#   brightness=$(echo "$line" | cut -d'|' -f5)
#
#   # Exemple de commande en direct (à adapter)
#   if [ "$wifi" = "TRUE" ]; then
#     nmcli r wifi on
#   else
#     nmcli r wifi off
#   fi
#
#   if [ "$bluetooth" = "TRUE" ]; then
#     rfkill unblock bluetooth
#   else
#     rfkill block bluetooth
#   fi
#
#   pactl set-sink-volume @DEFAULT_SINK@ "${volume}%"
#   brightnessctl set "${brightness}%"
# done
