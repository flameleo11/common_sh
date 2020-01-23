# call by GUI
if [ -f /home/me/app/bin/common.sh ]; then
    . /home/me/app/bin/common.sh
fi

# echo "${@:2}"
# echo "${*:2}"

function msgbox2() {
  # bash -c notify-send ${*:2}
  zenity --info --text="${*:2}" --width=1000 --height=400 &
}

run "$@"
