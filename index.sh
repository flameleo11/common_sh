# call by Terminal
# link by ~/.bash_aliases

export PATH="/home/me/app/bin:$PATH"

if [ -f /home/me/app/bin/common.sh ]; then
    . /home/me/app/bin/common.sh
fi



if ! [ "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' ]; then
  record_bash_log
fi

