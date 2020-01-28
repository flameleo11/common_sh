# call by Terminal
# link by ~/.bash_aliases

export PATH="/home/me/app/bin:$PATH"

if [ -f /home/me/app/bin/common.sh ]; then
    . /home/me/app/bin/common.sh
fi

if ! [ "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' ]; then
	# cd ~/tmp  # 导致FS右键open term here失效 自动进入该目录
	# 找到调用命令 ,区分普通打开 terminal 和右键调用 打开 terminal
  record_bash_log
fi

if [ $TILIX_ID ]; then
	cd ~/tmp
fi


