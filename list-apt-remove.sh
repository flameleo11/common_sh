#sudo apt-get install -y --ignore-missing $(
# ukuu

#for i in $(cat /var/log/dpkg.log |grep -oP "(?<=2020-01-25 0\d:\d\d:\d\d remove )\S*"); do 
  #echo -n "$i "; 
 # echo install "$i"
  #sudo apt install -y "$i"
#done 



#$(cat /var/log/dpkg.log |grep -oP "(?<=2020-01-25 0\d:\d\d:\d\d remove )\S*")
 

cat /var/log/dpkg.log |grep -oP "2020-01-24 0\d:\d\d:\d\d remove \S*"


#cat /var/log/dpkg.log |grep -oP "2020-01-25 0\d:\d\d:\d\d remove \S*"



pkgname=$(echo libgnutls30:i386=3.5.18-1ubuntu1.3| cut -d ":|=" -f 1)



Closed. This question needs details or clarity. It is not currently accepting answers.
Want to improve this question? Add details and clarify the problem by editing this post.

Closed 4 years ago.

I have input file name as:

Sample_0000860156-001-out_20150224150524.xml.gz



This will create a new empty file for every *.gz on the directory that keeps the pattern of the example:

touch $(ls *.gz | awk -F '_' {'print $2'} | awk -F "-out" {'print $1'})
or as suggested by Jidder :

touch $(ls *.gz | awk -F '_|-out' {'print $2'})