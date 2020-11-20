# link by ~/.bash_aliases
# use for Terminal

function msgbox() {
  # bash -c notify-send ${*:2}
  # zenity --info --text="${*:1}" --width=1000 --height=400 &
  # /usr/bin/xmessage
  gxmessage "args:
  1 $1
  2 $2
  3 $3
  4 $4
  5 $5
  6 $6
  7 $7";
  export PATH="$PATH:/opt/wine-staging/bin/"
}

if [ -f /drive_d/work/bin/common.sh ]; then
  . /drive_d/work/bin/common.sh
fi


# if ! [ "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' ]; then
# 	# cd ~/tmp  # 导致FS右键open term here失效 自动进入该目录
# 	# 找到调用命令 ,区分普通打开 terminal 和右键调用 打开 terminal
#   record_bash_input
# fi

bash_history_log

# if [ $TILIX_ID ]; then
# 	# cd ~/tmp
# 	# 会导致新建窗口时 无法继承上一个窗口路径
# fi


