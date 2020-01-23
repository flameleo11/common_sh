# env var
# export STEAM_COMPAT_DATA_PATH=$HOME/proton
export MY_STEAM_PROTON="/drive_d/SteamLibrary/steamapps/common/Proton 4.11/"
export nul="/dev/null"


function my_bash_doc_helps() {
  rem preserves the breaks between them \
  even if some of the arguments themselves contain spaces
  echo "${@:2}"
  rem as a single argument with spaces
  echo "${*:2}"    
}

function lsproxy() {
  echo $http_proxy
  echo $https_proxy
  echo $ftp_proxy
  echo $all_proxy
}

function setproxy() {
  export http_proxy=http://127.0.0.1:37629/
  export https_proxy=https://127.0.0.1:37629/
  export ftp_proxy=ftp://127.0.0.1:37629/
  export socks_proxy=https://127.0.0.1:46587/
  export all_proxy=$socks_proxy

  export HTTP_PROXY=$http_proxy
  export HTTPS_PROXY=$https_proxy
  export FTP_PROXY=$ftp_proxy
  export SOCKS_PROXY=$socks_proxy
  export ALL_PROXY=$all_proxy

  export no_proxy="localhost, 127.0.0.0/8, ::1, *.aliyun.com, *.bilibili.com, *.edu.cn"
  export NO_PROXY=$no_proxy

  echo $http_proxy
  echo $https_proxy
  echo $ftp_proxy
  echo $all_proxy
}


# fast char option
alias c='clear'
alias g='grep -i $*'
alias gn='grep -iv $*'


alias t='testsh'
alias r='updatesh'
alias rd='update_desktop_lnk'
alias ra='update_apt_repo'
alias pc='sysinfo'



# function


alias sudo='sudo '
alias p2do='sudo -u p2 -s '

alias xcopy='xargs cp -t $*'

alias rm='rm -i '



# alias ve='!$'
# alias va='${BASH_ALIASES[ve]}'
# alias vi='!$*'


alias dbl='sudo updatedb && locate'
alias p='ping $1 -c 5'

# ls show all file 
alias la='ls -a'
alias lx='lsproxy'
alias px='setproxy'




# short comamnd
alias getpass="openssl rand -base64 20"
alias ipe='curl ipinfo.io/ip'
alias ipi='ipconfig getifaddr en0'
alias sha='shasum -a 256 '
alias speed='speedtest-cli --server 2406 --simple'
alias untar='tar -zxvf '
alias wget='wget -c '
alias www='python -m SimpleHTTPServer 8000'
alias ping='ping -c 5'
alias pid='ps -aux |g $*'

# alias var='echo `$$1`'

# hotkey
alias calc='gnome-calculator'
alias taskmgr='gnome-system-monitor'
alias explorer='xdg-open'

alias app-store='gnome-software'
alias logout='gnome-session-quit'

alias hist='history | tail $*'

alias startup='sudo gnome-session-properties'
alias pause='read -p "Press enter to continue"'

function lsnet() {
  sudo nethogs
}

function nmcli_connect() {
  nmcli device status
  nmcli device connect enp7s0
  nmcli device disconnect enp7s0

  nmcli connection show --active
  nmcli connection down  ea7e43b6-b8a8-32b0-8087-a10d695f2f16
  nmcli connection up  ea7e43b6-b8a8-32b0-8087-a10d695f2f16
}

function clean() {
  sudo apt autoremove
}

function bakcrash() {
  pushd /var/crash
  ls
  sudo mv *.crash mylog
  sudo mv *.upload mylog
  sudo mv *.uploaded mylog
  ls
  popd
}

function lscrash() {
  pushd /var/crash
  ls
}

alias killbash='killall bash'
alias killterm='killall gnome-terminal-server'

alias regedit='run dconf $*'

function cmd() {
  # alias cmd='gnome-terminal'

  if [ -z "$*" ]; then
    echo gnome-terminal .
    # killall gnome-terminal-server
    # killall bash
    # exec env GTK_THEME=Arc gnome-terminal .
    GTK_THEME=Arc gnome-terminal .

  else
    echo sudo gnome-terminal $*
    sudo GTK_THEME=Arc gnome-terminal $*
  fi  
}

function fs() {
  if [ -z "$*" ]; then
    echo nautilus .
    # nautilus -q
    run fs_1 .;
  else
    echo nautilus $*
    # sudo nautilus -q
    run fs_1 $*;
  fi  
}

function FS() {
  if [ -z "$*" ]; then
    echo sudo nautilus .
    # nautilus -q
    run fs_1_root .;
  else
    echo sudo nautilus $*
    # sudo nautilus -q
    run fs_1_root $*;
  fi  
}

function st3() {
  if [ -z "$*" ]; then
    echo subl .
    run subl .;
  else
    echo subl $*
    run subl $*;
  fi  
}

function ST3() {
  if [ -z "$*" ]; then
    echo subl .
    run subl-root .;
  else
    echo subl $*
    run subl-root $*;
  fi  
}

function vscode() {
  if [ -z "$*" ]; then
    echo code .
     code .
  else
    echo code $*
     code $*
  fi  
}

function lg() {
  ls | grep -i "$*"
}

function lgrm() {
  ls | grep -iZ "$*" | xargs sudo rm -r
}

function delete_all_link() {
  find . -type l |xargs rm -f
}


function find_by_type() {
  find . -type l 
}


function dir() {
  # local di="$1"
  # local fi=`basename "$1"`

  # bg_ pushd $*

  # no recursive
  # ls $PWD/$*    

  # recursive
  find_in $*
  # bg_ popd
}

function find_in() {
  if [ -z "$*" ]; then
     find . -type f
    echo find .
  else
     find $* -type f
    echo find $*
  fi  
}


# # todo $0 $-1
# function backwardshell() {
#   ls | grep -Z "$*" | xargs sudo rm
  
#   ls /home/me/.pam_environment | xargs subl 
# }

function change_xterm() {
  sudo update-alternatives --config x-terminal-emulator
}


function ver_term(){
  term=$(ps -p $(ps -p $$ -o ppid=) -o args=);
  found=0;
  case $term in
    *gnome-terminal*)
      found=1
      echo "gnome-terminal " $(dpkg -l gnome-terminal | awk '/^ii/{print $3}')
      ;;
    *lxterminal*)
      found=1
      echo "lxterminal " $(dpkg -l lxterminal | awk '/^ii/{print $3}')
      ;;
    rxvt*)
      found=1
      echo "rxvt " $(dpkg -l rxvt | awk '/^ii/{print $3}')
      ;;
    ## Try and guess for any others
    *)
      for v in '-version' '--version' '-V' '-v'
      do
          $term "$v" &>/dev/null && eval $term $v && found=1 && break
      done
      ;;
  esac
  ## If none of the version arguments worked, try and get the 
  ## package version
  [ $found -eq 0 ] && echo "$term " $(dpkg -l $term | awk '/^ii/{print $3}')    
}

# converts and saves youtube video to mp3
function youtube-mp3() {
  youtube-dl --extract-audio --audio-format mp3 $1
}

function ret() {
  # show last command exit code
  local x=$?
  echo last command exit $x

}

function rem() {
  if [ "$1" == "echo" ]; then
    echo $*
  fi
}

function lns() {
  rem ln -s [target] [lnk]     // soft link for file or folder
  ln -s "$1" "$2"
}

alias rlns='lnk'
function lnk() {
  rem ll [lnk] -\> [target]     // reverse ln -s
  echo lnk $1 -\> $2
  echo ln -s "$2" "$1"
  ln -s "$2" "$1"
}

# To create a new desktop shortcut launcher on Ubuntu 18.04 execute the following linux command:
# sudo apt-get install --no-install-recommends gnome-panel
function gnome-lnk() {
  gnome-desktop-item-edit --create-new .
}

function add_inotify_max() {
  echo /etc/sysctl.conf append line
  echo "fs.inotify.max_user_watches=1048576" 
  
  echo "fs.inotify.max_user_watches=1048576" | sudo tee -a /etc/sysctl.conf
  sudo sysctl -p
}

# function
function sss() {
  echo -- apt-cache search -------------------------------------
  sudo apt-cache search $*

  echo -- apt search -------------------------------------
  sudo apt search $*

  echo -- snap find -------------------------------------
  sudo snap find $*
}

function apt-list() {

  echo -- apt-mark showmanual-------------------------------------
  apt-mark showmanual

  echo -- aptitude search -------------------------------------
  aptitude search '~i!~M'

  echo -- apt list -------------------------------------
  sudo apt list --installed $*

  echo -- snap find -------------------------------------
  sudo snap list $*

  # apt-file list gnome-keyring

  # list install location
  # dpkg -L tomcat7
}



function install() {
  sudo apt install $*
  ver $*
}

function deb() {
  sudo dpkg -i $* 
  sudo apt-get install -f
}

function reinstall() {
  ver $*
  sudo apt install --reinstall $*
  ver $*
}


function ver() {
  apt-cache policy $*
}

function ver-all() {
  apt-cache depends $*
  apt-cache rdepends $*
  apt-cache policy $*
}


function apt-why() {
  ver $*
  apt-cache depends $*
  apt-cache rdepends $*
  aptitude why $*
}

alias apt-dep='apt-why'


function apt-gui() {
  aptitude
}



function apt-src() {
  apt source $*
}

function remove() {
  sudo apt-get remove $*
  sudo apt-get remove --auto-remove $*
  sudo apt-get purge $*
  sudo apt-get purge --auto-remove $*

  # apt-get autoremove
  # aptitude remove packagename
}

function uninstall() {
  sudo apt-get remove $*
  sudo apt-get remove --auto-remove $*
  sudo apt-get purge $*
  sudo apt-get purge --auto-remove $*
}

function apt-fix-broken() {
  # sudo apt-get clean && sudo apt-get update
  # sudo apt-get upgrade
  # sudo apt update
  # apt list --upgradable
  apt list --upgradable
  sudo apt autoremove 
  sudo dpkg --configure -a
  sudo apt-get -f install 
  # sudo aptitude install wine-staging
  # sudo apt-get install --install-recommends winehq-staging
  # sudo mv /var/lib/dpkg/info/polar-bookshelf.* /tmp
}

function apt-levelup() {
  # alias SAUU='sudo apt update; sudo apt -y upgrade'

  sudo apt upgrade
}

function apt-repo() {
  # add-apt-repository -y $1
  echo add-apt-repository $1  
  echo apt-get update
  echo apt-get install -y $2 $3 $4 $5 $6 $7 $8 $9

# apt-repo ppa:paulo-miguel-dias/pkppa mesa-utils mesa-vulkan-drivers

  sudo add-apt-repository $1 && \
  apt-update-install ${@:2}

  ver $2 $3 $4 $5 $6 $7 $8 $9
}

function apt-from() {
  # add-apt-repository -y $1
  echo add-apt-repository $1
  echo apt-get update
  echo apt-get $2 -y $3 $4 $5 $6 $7 $8 $9

  sudo add-apt-repository $1 && \
  apt-update-install ${@:3}
}

function apt-update-install() {
  sudo apt-get update 
  sudo apt-get install -y $*
  ver $*
}

function apt-update() {
  for repo in "$@"; do
    echo $repo
    # sudo apt-get update -o Dir::Etc::sourcelist="sources.list.d/${repo}" \
    # -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"    
  done
}

function giveme() {
  rem get current folder and all files permission
  sudo chown -hR me:me .
  # chmod ug+rwx -R $*
}

function ownthis() {
  rem get current fold permission
  sudo chown -hR me:me $*
  # chmod ug+rwx -R .
}

function setowner() {
  # start lantern
  sudo chown -hR $* .
  chmod ug+rwx -R .
}

function getchmod() {
  # stat -c '%a' [file]
  # stat -f "%OLp" [file]
  # stat --format '%a' [file]
  stat --format '%a' $*
}


function x() {
  sudo chmod ug+rwx -R $*
}


function start() {
  # start lantern
  # nohup $1 &
  # bash -c $*
  $* > $nul 2>&1 & disown
}

# alias bg_='$* > /dev/null 2>&1 '
function bg_() {
  $* > $nul 2>&1
}

function xcursor-format() {
  local d='.'
  if [ ! -z "$*" ]; then
    d=`dirname "$1"`
  fi

  pushd $d

  cp row-resize  row-bak   
  cp col-resize  col-bak
  cp nesw-resize  nesw-bak
  cp nwse-resize  nwse-bak

  rm -rf *resize

  cp row-bak   row-resize
  cp col-bak   col-resize
  cp nesw-bak   nesw-resize
  cp nwse-bak   nwse-resize

  ln -s row-resize  ns-resize
  ln -s col-resize  ew-resize

  ln -s ns-resize  n-resize
  ln -s ns-resize  s-resize
  ln -s ew-resize  e-resize
  ln -s ew-resize  w-resize

  ln -s nesw-resize  ne-resize
  ln -s nesw-resize  sw-resize
  ln -s nwse-resize  nw-resize
  ln -s nwse-resize  se-resize

  popd
}

# mkdir && touch
function ptouch() {
  local dir=`dirname "$1"`
  local fname=`basename "$1"`

  mkdir -p "$dir" && pushd "$dir" && touch "$fname" && popd
  ls $1
}

function mp() {
  mkdir -p $1
  ls $1
}

function cf() {
  echo $1
  # local ret=echo $1
  # if [[ $ret -ne 0 ]]; then
    local dir=`dirname "$1"`
    cd $dir
  # fi 
}

function string_upper() {
  local x="$*"
  echo ${x^^}
}

function string_lower() {
  local x="$*"
  echo ${x,,}
}

function string_camel() {
  local x="$*"
  x=${x,,}
  echo ${x^}
}

function pushf() {
  echo $1
  # local ret=echo $1
  # if [[ $ret -ne 0 ]]; then
    local dir=`dirname "$1"`
    pushd $dir
  # fi 
}

function compare_match_incase() {
  # dir=`dirname "$1"` 111
  # fname=`basename "$1"`

  echo $1, $2
  
  if echo $1 |grep -i ^$(echo $2)$; then
      echo it works
  fi

  [[ $1 =~ $2 ]] && echo "match" || echo "not"
  # echo `$*`    # as command
  # echo '$*'    # as no escape
  # echo "$*"    # as str  paser $var to ist content

}

# app shortcut
alias openra='/drive_d/game/openRA/OpenRA-Red-Alert-x86_64.AppImage'
alias red98='/drive_d/game/openRA/OpenRA-Red-Alert-x86_64.AppImage'

function app() {
  # to my custom app
  # "/home/me/app/bin/custom-app.sh"
  run "$@"
}

function debugecho() {
  # to my custom app
  # "/home/me/app/bin/custom-app.sh"

  # "${@:2}"  seperate 2 "path"
  # "$args"  join to 1 "path"
  # $args   no "" maybe seperate by space to 4 path



  echo 1 $1
  echo 2 $2
  echo 3 $3
  echo 4 $4
  echo 5 $5
  echo 6 $6
  echo 7 $7

}

function debugmsg() {
  # to my custom app
  # "/home/me/app/bin/custom-app.sh"

  # "${@:2}"  seperate 2 "path"
  # "$args"  join to 1 "path"
  # $args   no "" maybe seperate by space to 4 path

  gxmessage "args:
  1 $1
  2 $2
  3 $3
  4 $4
  5 $5
  6 $6
  7 $7";

}

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
}


# wine shortcut
function run() {
  local name=$(string_lower $1)
  local args="${@:2}"
  local path=""

  echo $name
  case $name in
    # wine
    "win-taskmgr")
      # WINEPREFIX=~/wine/win10/ 
      wine taskmgr
      ;;
    "win-subl")
      # WINEPREFIX="/drive_d/wine/dx9/" \
      wine "/drive_d/dev/SublimeText3207/subl.exe" -n
      return 
      ;;
    "win-everything")
      # WINEPREFIX="/drive_d/wine/dx9/" \
      wine "/drive_d/app/Everything-x64/Everything.exe"
      ;;
    "win-track_folder")
      WINEPREFIX="/drive_d/wine/dx9/" \
      wine "/drive_d/app/TrackFolderChanges/TrackFolderChanges.exe"
      ;;
    "win-bc")
      WINEPREFIX="/drive_d/wine/dx9/" \
      wine "/drive_d/dev/BCompare3/BComp.exe" "${@:2}"
      ;;


    "win-bcomp-diff")
      # /usr/bin/meld 
      # /home/me/app/bin/bcomp
      local f1=$(winepath -w "$2")
      local f2=$(winepath -w "$3")

      # debugmsg "$2" "$3"
      # msgbox "$f1" "$f2"
      WINEPREFIX="/drive_d/wine/dx9/" \
      wine "/drive_d/dev/BCompare3/BComp.exe" "$f1" "$f2"
      ;;      
    "win-bcomp-merge")
      local f1=$(winepath -w "$2")
      local f2=$(winepath -w "$3")
      local f3=$(winepath -w "$4")
      local f4=$(winepath -w "$5")

      # debugmsg "$2" "$3"
      debugmsg "$f1" "$f2" "$f3" "$f4"
      msgbox "$*"
      # WINEPREFIX="/drive_d/wine/dx9/" \
      # wine "/drive_d/dev/BCompare3/BComp.exe" "$f1" "$f2" "$f3" "$f4"
      ;;


    "win-install")
      # /usr/bin/meld 
      # /usr/bin/gxmessage
      # local f1=$(winepath -w "$2")
      # local f2=$(winepath -w "$3")

      # # debugmsg "$2" "$3"
      # debugmsg "$f1" "$f2"
      WINEPREFIX="/drive_d/wine/dx9/" \
      wine uninstaller
      ;;  

    # proton
    "proton")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
      run "$args";
      # /home/me/.wine/dosdevices/d:/SteamLibrary/steamapps/compatdata/692850/pfx/dosdevices/c:/users/steamuser/Local Settings/Application Data/BloodstainedRotN/Saved/SaveGames/Story_Slot*.sav
      ;;
    "proton-ce")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/app/Cheat Engine 6.7/Cheat Engine.exe"
       # run "C:\Program Files (x86)\Cheat Engine 6.7\Cheat Engine.exe"
      ;;
    "proton-taskmgr")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run taskmgr
      ;;
    "proton-ahk")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/app/AutoHotkey-v1/AutoHotkey.exe" "/home/me/work/AutoHotkey/repeat-key.ahk"
       # run "C:\Program Files (x86)\Cheat Engine 6.7\Cheat Engine.exe"
      ;;
    "proton-ahk2")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/app/AutoHotkey-v1/AutoHotkey.exe" "/home/me/work/AutoHotkey/repeat-key2.ahk"
       # run "C:\Program Files (x86)\Cheat Engine 6.7\Cheat Engine.exe"
      ;;
    "proton-ahk-demo")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/app/AutoHotkey-v1/AutoHotkey.exe" "/home/me/work/AutoHotkey/demo/test-joystick-demo.ahk"
       # run "C:\Program Files (x86)\Cheat Engine 6.7\Cheat Engine.exe"
      ;;

      
    "war3")
      # STEAM_COMPAT_DATA_PATH="/drive_d/proton/stellaris/" \
      # "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
      #  run "/drive_d/game/war3_126_en/War3.exe"
      
      # export WINEPREFIX=~/wine/win10/ 
      # export WINEARCH=win32
      # export WINEPREFIX="/drive_d/wine/dx9"winetricks

      WINEPREFIX="/drive_d/wine/dx9" WINEARCH=win32 \
      winetricks corefonts
      # wine uninstaller
      # winecfg
      # wine "C:\windows\system32\dxdiag.exe"
      # winetricks --force dotnet40
      # winecfg
      # winetricks
      # wine "C:\DirectX\Jun2010\DXSETUP.exe"
      # wine "C:\windows\system32\dxdiag.exe"
      
      # LANG="zh_CN.UTF-8" 
      # LANG="en_US.UTF-8" 
      # LANG="en_US" 

      # LANG="zh_CN.UTF-8" WINEPREFIX="/drive_d/wine/dx9" WINEARCH=win32 \
      # wine "/drive_d/game/war3-121/War3.exe" -opengl "$args"


      # LANG="zh_CN.UTF-8" WINEPREFIX="/drive_d/wine/dx9" WINEARCH=win32 \
      # wine "/drive_d/game/WC3-Installer-1-30_EN/Warcraft-III-Setup.exe"

      ;;
    "worldedit")
      STEAM_COMPAT_DATA_PATH="/drive_d/game/compatdata/war3/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/game/war3-121/worldedit.exe"
      ;;


    "proton-star")
      STEAM_COMPAT_DATA_PATH="/drive_d/proton/stellaris/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/game/Stellaris2/stellaris-LAN.exe"
       # run "D:\game\Stellaris2\stellaris-LAN.exe"
       # save location
       # /media/me/GIT1/game/Stellaris/Paradox Interactive/Stellaris
      ;;
    "proton-star-ahk")

      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
       run "/drive_d/app/AutoHotkey-v1/AutoHotkey.exe" "/home/me/work/AutoHotkey/stellaris-proton.ahk"
       # run "C:\Program Files (x86)\Cheat Engine 6.7\Cheat Engine.exe"
      ;;


    "blood_rotn")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
      run "/drive_d/SteamLibrary/steamapps/common/Bloodstained Ritual of the Night/BloodstainedRotN.exe"
      ;;
    "hollow_knight")
      STEAM_COMPAT_DATA_PATH="/drive_d/SteamLibrary/steamapps/compatdata/692850/" \
      "/drive_d/SteamLibrary/steamapps/common/Proton 4.11/proton" \
      run "/drive_d/SteamLibrary/steamapps/common/Hollow Knight/hollow_knight.x86_64.exe"
      ;;

    # xcross wine to linux
    "open-win")
      local file=$(winepath -u "${*:2}")
      # msgbox  "$file"
      xdg-open "$file"
      ;;
    "fs-win")
      local file=$(winepath -u "${*:2}")
      # msgbox  "$file"
      GTK_THEME=Flat-Remix-GTK-Green nautilus "$file"
      ;;

    "winx-copy-path")
      local file=$(winepath -u "${*:2}")
      udg_file3=$(winepath -u "${*:2}")

      # echo "$udg_file3" | xsel -b 
      # msgbox "$file";
      clipit "$file";

      ;;

    # linux
    bc|meld)
      if [ -z "$2" ]; then
        GTK_THEME=Arc meld "/home/me/1.txt" "/home/me/2.txt"
      else
        GTK_THEME=Arc meld "${@:2}"
      fi
      ;;

    "fs")
      GTK_THEME=Flat-Remix-GTK-Green nautilus --new-window "$args"
      ;;
    "fs-root")
      sudo -S GTK_THEME=Flat-Remix-GTK-Red nautilus --new-window "$args"
      ;;


    "fs_1")
      thunar -q 
      start env GTK_THEME=Flat-Remix-GTK-Blue thunar "$args"
      ;;
    "fs_1_root")
      sudo nautilus -q 
      start sudo env GTK_THEME=Flat-Remix-GTK-Yellow-Dark nautilus "$args"
      ;;

    "apt-pm")
      sudo -S GTK_THEME=Flat-Remix-GTK-Red synaptic "$args"
      ;;      

    "dconf")
      killall dconf-editor
      GTK_THEME=Arc dconf-editor ${@:2}
      wmctrl -a "dconf Editor"
      wmctrl -r :ACTIVE: -e 0,50,50,800,600
      ;;

    "taskmgr")
      killall gnome-system-monitor
      GTK_THEME=Flat-Remix-GTK-Green gnome-system-monitor -r ${@:2}
      wmctrl -a "System Monitor"
      ;;
    "taskmgr2")
      killall gnome-system-monitor
      GTK_THEME=Flat-Remix-GTK-Yellow-Dark gnome-system-monitor -p ${@:2}
      wmctrl -a "System Monitor"
      ;;

    "gimp")
      GTK_THEME=Arc gimp ${@:2}
      ;;
    "xterm")
      GTK_THEME=Arc gnome-terminal ${@:2}
      ;;

    "subl")
      sudo GTK_THEME=Arc subl -n ${@:2}
      ;;  
    "subl-root")
      sudo GTK_THEME=Flat-Remix-GTK-Red subl -n ${@:2}
      ;;  


    "tweaks"|"skin"|"theme")
      killall gnome-tweaks
      GTK_THEME=Arc gnome-tweaks ${@:2}
      wmctrl -a "GNOME Tweaks"
      wmctrl -r :ACTIVE: -e 0,50,50,800,600
      ;;
    "setting")
      killall gnome-control-center
      GTK_THEME=Flat-Remix-GTK-Green-Dark gnome-control-center network ${@:2}
      wmctrl -a "Settings"
      ;;
    "setting-key")
      killall gnome-control-center
      GTK_THEME=Flat-Remix-GTK-Green gnome-control-center keyboard ${@:2}
      wmctrl -a "Settings"
      ;;

    *)
      echo app func no case for $*
      ;;

  esac

}


# wine shortcut
function win() {
  local name=$(string_lower $1)
  local path=""
  case $name in
    "cmd")
      path="cmd"
      ;;
    "fs")
      path="explorer"
      ;;
    "mine")
      path="C:\windows\syswow64\winemine.exe"
      ;;
    "taskmgr")
      run "win-taskmgr" "${@:2}"
      ;;
    "subl")
      run "win-subl" "${@:2}"
      ;;
    "everything")
      run "win-everything" "${@:2}"
      ;;
    bc|bcomp|bcompare)
      run "win-bc" "${@:2}"
      ;;
    *)
      echo win func no case for $*
      ;;
  esac

}

function logbash() {
  # echo logbash to ~/log/ (cache: ~/data)
  # mkdir ~/my-etc/data2/ && touch 111.txt
  # mkdir -p ~/my-etc/data4/ && pushd ~/my-etc/data4/ && touch 111.txt && popd

  # touch 
  # exec ~/my-etc/data/bash_history.txt
  # lua filter get data to  ~/log/
  echo 111
}

# build 
# source .bash_aliases
function updatesh() {
  if ! [ "$HOME" -ef "/home/me" ]; then
    cp /home/me/.bash_aliases ~
  fi
  sudo cp /home/me/.bash_aliases /root

  sudo ls ~/.bash_aliases
  sudo ls /root/.bash_aliases
  source ~/.bash_aliases
}

function update_desktop_lnk() {
  echo /var/lib/snapd/desktop/applications
  echo /usr/share/ubuntu/applications
  echo /usr/share/applications
  echo /usr/local/share/applications
  echo \~/.local/share/applications

  sudo update-desktop-database
}

function update_apt_repo() {
  sudo apt update
}

function sysinfo() {
  lsb_release -a
  uname -a
  # lsb_release -c
  # uname -r
}

function testsh() {
  echo "Fetching OpenAL-CS from GitHub."
  if command -v curl >/dev/null 2>&1; then
    echo 1
    # curl -s -L -O https://github.com/OpenRA/OpenAL-CS/releases/download/20190907/OpenAL-CS.dll
    # curl -s -L -O https://github.com/OpenRA/OpenAL-CS/releases/download/20190907/OpenAL-CS.dll.config
  else
    echo 2
    # wget -cq https://github.com/OpenRA/OpenAL-CS/releases/download/20190907/OpenAL-CS.dll
    # wget -cq https://github.com/OpenRA/OpenAL-CS/releases/download/20190907/OpenAL-CS.dll.config
  fi


  echo version: 112
}

export MY_BASH_LOG_FILE="/home/me/Documents/bash-log/bash-usr_$EUID-$(date +"%Y_%m_%d").log"

function bash_log() {
  # local path="/home/me/Documents/bash-log/bash-usr_$EUID-$(date +"%Y_%m_%d").log"
  local path="$MY_BASH_LOG_FILE"
  local todo="$1"
  local status="off"


  # set $1 default
  if [ -z "$1" ]; then
    todo="on"
  fi

  if [ "$(ps -ocommand= -p $PPID | awk '{print $1}')" == 'script' ]; then
    status="on"
  fi

  # echo debug: $todo $status
  case $todo in
    on|start)
      test $status == "on" && echo bash log already turn on ||script -faq $path
      ;;

    c|status)
      echo status: $status
      ;;

    off|exit|quit|stop)
      test $status == "off" && echo bash log already stop || exit;
      ;;

    watch|show)
      test $status == "on" && echo please exit bash log first || tail -f $path;
      ;;
    
    *)
      echo bash_log not find $*
      ;;
  esac

}

function tt1() {
  echo 777
}

function show_bash_log() {
  bash_log watch
}

function record_bash_log() {
  bash_log on
}




