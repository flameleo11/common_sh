#!/bin/bash
# export PATH="/home/me/app/bin:$PATH"

function sound() {
  # aplay /usr/share/sounds/alsa/Side_Right.wav
  # paplay /usr/share/sounds/freedesktop/stereo/complete.oga
  local ussd=/usr/share/sounds/ubuntu/notifications
  local wav="$1"

  # set $1 default
  if [ -z "$1" ]; then
    wav="Positive.ogg"
  fi

  if [ "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' ]; then
    status="on"
  fi

  # 'Soft delay.ogg'
  # Amsterdam.ogg
  # Blip.ogg
  # Mallet.ogg
  # Positive.ogg
  # Rhodes.ogg
  # Slick.ogg
  # Xylo.ogg
  paplay $ussd/$wav
  # paplay /usr/share/sounds/alsa/Side_Right.wav
}

function msgbox() {
  gxmessage "args:
  1 $1
  2 $2
  3 $3
  4 $4
  5 $5
  6 $6
  7 $7";
}

function subl() {
  /drive_d/dev/SublimeText3211_x64_linux/sublime_text $*
}
# msgbox "@*" &

GTK_THEME=Arc subl -n $*
sound&