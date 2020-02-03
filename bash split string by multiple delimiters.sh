

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


# name
echo libgnutls30:i386=3.5.18-1ubuntu1.3| awk -F ':|=' {'print $1'}
# i386
echo libgnutls30:i386=3.5.18-1ubuntu1.3| awk -F ':|=' {'print $2'}
# version
echo libgnutls30:i386=3.5.18-1ubuntu1.3| awk -F ':|=' {'print $3'}



echo libgnutls30:i386=3.5.18-1ubuntu1.3| awk -F ':|=' {'print $2'}


$(ls *.deb 