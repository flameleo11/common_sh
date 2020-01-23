# call by Terminal

if [ -f /home/me/app/bin/common.sh ]; then
    . /home/me/app/bin/common.sh
fi


if ! [ "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' ]; then
  msgbox "start show log"
  show_bash_log
fi