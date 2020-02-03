#!/bin/bash
aplay /usr/share/sounds/alsa/Side_Right.wav

function start() {
  $* > $nul 2>&1 & disown
}

#!/usr/bin/bash
# echo $1

aplay /usr/share/sounds/alsa/Side_Right.wav
