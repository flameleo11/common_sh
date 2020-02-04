#!/bin/bash
# export PATH="/home/me/app/bin:$PATH"
# sudo updatedb && locate $* 

# to check
# why alias in sbin sh be called not working
# alias dbl='sudo updatedb && locate'

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

function print() {
  # echo $*
  return 0
}

# vala  "-v svg$" for gn grep
function fs_multi() {
  local args="$@"
  # print 333 $args
  # print 333 $1,$2

  # msgbox total: "$@"  len: ${#text}

  if [ -z "$2" ]; then
    # msgbox 111 $1 $2 $3
    fs_main $1
  elif [ -z "$3" ]; then
    # msgbox 222 "$1" "$2" "$3"
    fs_main $1 |g $2
  elif [ -z "$4" ]; then
    fs_main $1 |g $2 |g $3
  elif [ -z "$5" ]; then
    fs_main $1 |g $2 |g $3 |g $4
  elif [ -z "$6" ]; then
    fs_main $1 |g $2 |g $3 |g $4 |g $5
  elif [ -z "$7" ]; then
    fs_main $1 |g $2 |g $3 |g $4 |g $5 |g $6
  elif [ -z "$8" ]; then
    fs_main $1 |g $2 |g $3 |g $4 |g $5 |g $6 |g $7
  elif [ -z "$9" ]; then
    fs_main $1 |g $2 |g $3 |g $4 |g $5 |g $6 |g $7 |g $8
  fi
}

function main() {
  local text="$*"
  # msgbox total: "$@"  len: ${#text}
  
  if [ -z "$1" ]; then
    # msgbox 000
    sudo updatedb
    return 0
  fi  

  if [ ${#text} -le 2 ]; then
    # msgbox 111
    fs_multi "$@" | head -n 30
  else
    # msgbox total: "$@"  len: ${#text}
    # msgbox 222
    fs_multi "$@" | head -n 60
  fi
  return 0
}

function fs_main() {
  # msgbox "$*" 
  # print 444 "$*" 
  # --null not good , output a joined bin text
  locate -i -e "$*" 
}

function g() {
  # print 555 $1
  grep -i --null --color=never "$*"
}

# msgbox $*
# main $*
main "$@"

# main $(echo "$*")

# main "everything search copy" "1 print str"

# $(echo main $@)

# "everything png" "as  df"}
# main $(escape_args $*)
# 
# main everything png

# locate float|g p |echo -n
# msgbox "$@" 
# main "$@" 