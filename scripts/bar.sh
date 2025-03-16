#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/gruvchad

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^ ^b$green^ CPU"
  printf "^c$white^ ^b$grey^ $cpu_val"
}

updates() {
  #updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  # updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l) # apt (ubuntu, debian etc)

  updates=$(echo "$updates" | tr -d '[:space:]')

  if [[ $updates = "0" ]]; then
    printf "    ^c$green^  "
  else
    printf "    ^c$green^ ^b$black^     $updates"
  fi
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$blue^   $get_capacity"
}

brightness() {
  printf "^c$red^ ^b$black^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^  "
  printf "^c$blue^ $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
  case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
  up) printf "^c$black^ ^b$blue^ 󰤨 ^d^%s" " ^c$blue^Connected" ;;
  down) printf "^c$black^ ^b$blue^ 󰤭 ^d^%s" " ^c$blue^Disconnected" ;;
  esac
}

eth() {
  case "$(cat /sys/class/net/eth0/operstate 2>/dev/null)" in
  up) printf "^c$black^ ^b$blue^ 󰈁 ^d^%s" " ^c$blue^Connected" ;;
  down) printf "^c$black^ ^b$blue^ 󰈂 ^d^%s" " ^c$blue^Disconnected" ;;
  esac
}

clock() {
  printf "^c$black^ ^b$darkblue^ 󱑆 "
  printf "^c$black^^b$blue^ $(date '+%d %h %H:%M')  "
}

weather() {
  curl -s 'wttr.in/Jumet?format=1'
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  sleep 1 && xsetroot -name "$(updates) $(mem) $(eth) $(weather) $(clock)"
done
