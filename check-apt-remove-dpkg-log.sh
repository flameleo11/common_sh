#sudo apt-get install -y --ignore-missing $(
# ukuu

#for i in $(cat /var/log/dpkg.log |grep -oP "(?<=2020-01-25 0\d:\d\d:\d\d remove )\S*"); do 
  #echo -n "$i "; 
 # echo install "$i"
  #sudo apt install -y "$i"
#done 



#$(cat /var/log/dpkg.log |grep -oP "(?<=2020-01-25 0\d:\d\d:\d\d remove )\S*")
 
cat -n /var/log/dpkg.log |grep -oP "2020-01-25 0\d:\d\d:\d\d remove \S*"
