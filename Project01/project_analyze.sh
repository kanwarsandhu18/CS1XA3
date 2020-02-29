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
if [ ! $code -eq 2 ] && [ ! $code -eq 5 ] && [ ! $code -eq 6 ] && [ ! $code -eq 7 ] && [ ! $code -eq 8 ] && [ ! $code -eq 11 ] && [ ! $code -eq 12 ] ; then
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
#FEATURE 6.7
if [ $code -eq 7 ]  ; then
echo "ENTER COMMAND  ; 'Change' for changing file permissions ,'Restore' for restoring  original permissions :"
read cmd
if [ $cmd = "Change" ] ; then
shell=$( find $file_path/ -name  "*.sh" -type f )
if [ -f "permissions.log" ] ; then
rm "permissions.log" ; touch "permissions.log"
fi
for k in $shell ; do
permit=$( stat $k | head -4 | tail -1 | cut -b 10-13 )
others=$( stat $k | head -4 | tail -1 | cut -b 15-24 )
filename=$(echo $k)
echo $permit" "$others" "$filename >> "permissions.log"
done
for j in $shell ; do
per=$(ls -la $j | cut -b 1-9 | grep -b -o "w"| cut -c 1 )
for i in $per ; do
if [ $i -eq 2 ] ;then
chmod u+x $j
elif [ $i -eq 5 ] ; then
chmod g+x  $j
elif [ $i -eq 8 ] ; then
chmod o+x $j
fi
done
done
echo "Persmissions were changed"
#restore
elif [ $cmd = "Restore" ] ; then
if [ ! -f "permissions.log" ] ; then
echo "ERROR , filename permissions.log does not exists "
else
v=$( cat "permissions.log" )
for d in $v ; do
IFS=$' '
b=( $d )
f1=${b[0]}
p1=$( echo $d | cut -b 17- )
IFS=$'\n'
chmod $f1 $p1
done
echo "Permissions were restored"
fi
else
echo " Wrong command  "
fi
fi
#6.8
if [ $code -eq 8 ] ; then
echo "ENTER COMMAND  ; 'Backup' or 'Restore' :"
read cmd
if [ $cmd = "Backup" ] ; then
#backup
if [ ! -d "backup" ] ; then
mkdir "backup"
else
rm -r "backup" ; mkdir "backup"
fi

temp=$( find $file_path/ -name "*.tmp" -type f )
for i in $temp ; do
actualpath=$( realpath $i )
cp $i "backup"
rm $actualpath
echo "$actualpath" >> "backup/restore.log"
done
echo "backup file has been made"

#restore
elif [ $cmd = "Restore" ] ;then
if [ ! -d "backup" ] ; then
echo " Backup cannot be made "
else
cd "backup"
if [ ! -f "restore.log" ] ; then
echo " Backup cannot be made "
else
fp=$(cat "restore.log")
for i in $fp ; do
directory=$(dirname $i)
filename=$(basename $i)
if [ ! -f $filename ] ; then
echo "ERROR !! " $filename "does not exists in backup"
else
mv $filename $directory
fi
done
echo " backup complete "
fi
fi
else
echo "Wrong Command "
fi
fi

#CUSTOM FEATURE 1
if [ $code -eq 11 ] ; then
if [ ! -f "safe.t" ] ; then
touch "safe.t"
elif [ -f "safe.t" ] ; then
rm "safe.t" ; touch "safe.t"
fi
drive=$(find $file_path/ -name "*.pass" -type f )
for item in $drive ; do
s=$(grep -E '[abcdefghijklmnopqrstuvwxyz][[:digit:]][ABCDEFGHIJKLMNOPQRSTUVWXYZ]' $item)
if [ $? -eq 0 ] ; then
a=$(grep -E '[abcdef][[:digit:]][ABCDEF]' $item)
echo -e  "\n$a" >> "safe.t"
fi
done
sed -i 's/[[:digit:]]/#/g' "safe.t"
sed -i '/$a/d' $drive
fi


#CUSTOM FEATURE 2
if [ $code -eq 12 ] ; then
declare -A aa
aa[A]=1
aa[B]=2
aa[C]=3
aa[D]=4
aa[E]=5
aa[F]=6
aa[G]=7
aa[H]=8
aa[I]=9
aa[J]=10
aa[K]=11
aa[L]=12
aa[M]=13
aa[N]=14
aa[O]=15
aa[P]=16
aa[Q]=17
aa[R]=18
aa[S]=19
aa[T]=20
aa[U]=21
aa[V]=22
aa[W]=23
aa[X]=24
aa[Y]=25
aa[Z]=26
echo " ENTER ANY NAME FOR YOUR FILE "
read name
for key in ${!aa[@]}; do
    echo ${key} >> "$name.key"
    echo ${aa[${key}]} >>"$name.value"
done
fi








