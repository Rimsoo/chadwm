#!/bin/dash

# ^c$var^ = fg color
# ^b$var^ = bg color

interval=0

# load colors
. ~/.config/chadwm/scripts/bar_themes/gruvchad

cvolume="$green"

cpu() {
  cpu_val=$(grep -o "^[^ ]*" /proc/loadavg)

  printf "^c$black^^b$green^ CPU"
  printf "^c$white^^b$grey^ $cpu_val"
}

pkg_updates() {
  #updates=$({ timeout 20 doas xbps-install -un 2>/dev/null || true; } | wc -l) # void
  # updates=$({ timeout 20 checkupdates 2>/dev/null || true; } | wc -l) # arch
  updates=$({ timeout 20 aptitude search '~U' 2>/dev/null || true; } | wc -l) # apt (ubuntu, debian etc)

  updates=$(echo "$updates" | tr -d '[:space:]')

  if [ $updates = "0" ]; then
    printf "^c$green^^b$green^^r0,-50,41,100^^c$black^     ^d^"
  else
    printf "^c$red^^b$red^^r0,-50,41,100^^c$black^     ^d^  ^c$red^$updates"
  fi
}

battery() {
  get_capacity="$(cat /sys/class/power_supply/BAT1/capacity)"
  printf "^c$blue^   $get_capacity"
}

brightness() {
  printf "^c$red^^b$black^   "
  printf "^c$red^%.0f\n" $(cat /sys/class/backlight/*/brightness)
}

mem() {
  printf "^c$blue^^b$black^   "
  printf "^c$blue^$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

wlan() {
  case "$(cat /sys/class/net/wl*/operstate 2>/dev/null)" in
  up) printf "^c$green^^b$green^^r0,-50,41,100^^c$black^  󰤨   ^d^" ;;
  down) printf "^c$red^^b$red^^r0,-50,41,100^^c$black^  󰤭   ^d^" ;;
  esac
}

eth() {
  case "$(cat /sys/class/net/enp*/operstate 2>/dev/null)" in
  up) printf "^c$green^^b$green^^r0,-50,41,100^^c$black^  󰈁   ^d^" ;;
  down) printf "^c$red^^b$red^^r0,-50,41,100^^c$black^  󰈂   ^d^" ;;
  esac
}

clock() {
  printf "^c$darkblue^^b$darkblue^^r0,-50,180,100^ ^c$black^ 󱑆 "
  printf "^c$black^^b$darkblue^ $(date '+%d %h %H:%M')"
}

weather() {
  get_weather=$(curl -s 'wttr.in/Jumet?format=1')
  printf "^c$red^$get_weather"
}

volume() {
  vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F/ '{ print $2 }' | tr -d '[:space:]%')
  vol=${vol:-0} # Si le volume est vide, définir à 0

  # Calculer la longueur de la barre (par exemple, 10 caractères pour 100%)
  len=10
  bar_length=$((vol / len))
  bar=""
  ebar=""
  for i in $(seq 1 $bar_length); do
    # if [ $i -eq 1 ]; then
    #   bar="${bar}"
    # elif [ $i -eq $len ]; then
    #   bar="${bar}"
    # else
    bar="${bar}󰹞"
    # fi
  done
  for j in $(seq $i $len); do
    # if [ $j -eq 1 ]; then
    #   ebar="${ebar}"
    # elif [ $j -eq $len ]; then
    #   ebar="${ebar}"
    # else
    ebar="${ebar}󰹞"
    # fi
  done

  printf "^c$cvolume^^b$black^    $bar^c$white^$ebar"
}

while true; do

  [ $interval = 0 ] || [ $(($interval % 3600)) = 0 ] && updates=$(pkg_updates)
  interval=$((interval + 1))

  if [ "$(echo "$updates" | grep -o '')" = "" ]; then
    cvolume="$red"
  else
    cvolume="$green"
  fi

  sleep 1 && xsetroot -name "    $updates  $(volume)  $(mem) $(eth) $(wlan)  $(weather)  $(clock)"
done
