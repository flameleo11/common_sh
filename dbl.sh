#!/bin/bash
# export PATH="/home/me/app/bin:$PATH"
# sudo updatedb && locate $* 

# to check
# why alias in sbin sh be called not working
# alias dbl='sudo updatedb && locate'

function dbl() {
  sudo updatedb && locate $* 
}

function find_main() {
  locate -i -e $* 
}

# vala  "-v svg$" for gn grep
function find_multi() {
  local text="$*"
  if [ -z $2 ]; then
    find_main $1
  elif [ -z $3 ]; then
    find_main $1 |grep -i $2
  elif [ -z $4 ]; then
    find_main $1 |grep -i $2 |grep -i $3
    echo 111
  elif [ -z $5 ]; then
    find_main $1 |grep -i $2 |grep -i $3 |grep -i $4
  elif [ -z $6 ]; then
    find_main $1 |grep -i $2 |grep -i $3 |grep -i $4 |grep -i $5
  elif [ -z $7 ]; then
    find_main $1 |grep -i $2 |grep -i $3 |grep -i $4 |grep -i $5 |grep -i $6
  elif [ -z $8 ]; then
    find_main $1 |grep -i $2 |grep -i $3 |grep -i $4 |grep -i $5 |grep -i $6 |grep -i $7
  elif [ -z $9 ]; then
    find_main $1 |grep -i $2 |grep -i $3 |grep -i $4 |grep -i $5 |grep -i $6 |grep -i $7 |grep -i $8
  fi
}

function search() {
  local text="$*"
  if [ ${#text} -ge 3 ]; then
    find_multi $* | head -n 200
  else
    if [ -z "$1" ]; then
      sudo updatedb
    else
      find_main $* | head -n 100
      # echo find_main $1 | head -n 100
    fi  
  fi
}

search $*

