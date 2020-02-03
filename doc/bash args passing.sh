# echo "${@:2}"
# echo "${*:2}"

function msgbox() {
  gxmessage "args:
  1 "$1"
  2 "$2"
  3 $3
  4 $4
  5 $5
  6 $6
  7 $7";
}

# msgbox "@*" &
# sound&

msgbox "$@"

