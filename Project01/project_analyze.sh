#!/bin/bash

#Introductory Prompt  #JUST FOR FUN!
echo -n "Hurry up and type your first name fast! > "
read text
echo -n "Hey! "  $text "press enter type your first name again but this time very fast"
read ds
echo -n "TYPE NOW>>"
if read -t 3 response; then
    echo "Great job ! You made it within 3 seconds . Your superhero name is flash"
elif read -t 6 response; then
    echo " Not bad , you made it within 6 seconds"
else
    echo "You were too slow or your name is too long!"
fi

cd ..
file_path=$(pwd)
cd Project01

echo -n " ENTER FEATURE CODE  AND PRESS ENTER >> "
read code
if [ ! $code -eq 2 ] && [ ! $code -eq 5 ] && [ ! $code -eq 6 ] ; then
echo "YOU ENTERED WRONG FEATURE CODE! , refer to to README.md and enter valid FEATURE CODE "
fi
IFS=$'\n'


#FEATURE 6.2
if [ $code -eq 2 ] ; then
if [ ! -f fixme.log ] ; then
touch fixme.log
elif [ -f fixme.log ] ; then
rm fixme.log ; touch fixme.log
fi
echo "Lines containing "#FIXME" in their last line >> "
find $file_path/ -type f -print0 | while IFS= read -d '' file
do
       cat $file | tail -1 |  grep "#FIXME"

       if [ $? -eq 0 ] ; then
       echo $file >> fixme.log
fi
done
fi

#FEATURE 6.5
if [ $code -eq 5 ] ; then
echo -n "Enter file extension >> "
read ext
c=$(find $file_path/ -name "*.$ext")
count=0
for item in $c ; do
count=$(( $count + 1 ))
done
echo  $count " files found with extension >> " $ext ;
fi

#FEATURE 6.6
if [ $code -eq 6 ] ; then
echo "enter TAG"
read tag
if [ ! -f $tag.log ] ; then
touch $tag.log
elif [ -f $tag.log ] ; then
rm $tag.log ; touch $tag.log
fi
echo "Comments found with your given tag >> "
s=$(find $file_path/ -name "*.py")
for item in $s ; do
grep -E '^#' $item  | grep $tag
if [ $? -eq 0 ] ; then
echo $(grep -E '^#' $item  | grep $tag ) >> $tag.log
fi
done
fi

