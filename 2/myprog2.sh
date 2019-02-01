#!/bin/bash
if ! [ $# -eq 1 ];then
  echo "Please give one argument as a txt file "; exit 20
fi

story=$1

#If file which you want to create is exist, program is going to ask that you want it to be modified.
if [ -e $1 ]; then
  echo "Do you want it to be modified? ? y/n"
  read ANSWER
  case $ANSWER in
  [nN])  [[ "$0" = "$BASH_SOURCE" ]] && exit 21 || return 1
esac
else
  echo >> $1
fi
#Writing permission control
if [[ ! -w $story ]]; then
  chmod +w $story
fi

#Existing files control
cond=0
for i in $story giris.txt gelisme.txt sonuc.txt
do
  if [ ! -f "$i" ]; then
      echo "$i file not found!"
      cond=1
  fi
done
if [ $cond -eq 1 ]
then
  exit 5
fi
#Reading permission control
for i in giris.txt gelisme.txt sonuc.txt
do
  if [ ! -r "$i" ]; then
      chmod +r $i
  fi
done

#Selecting a random line from each file.
giris=$(shuf -n 1 "giris.txt")
while [ -z "$giris" ]
do
giris=$(shuf -n 1 "giris.txt")
done
echo $giris

gelisme=$(shuf -n 1 gelisme.txt)
while [ -z "$gelisme" ]
do
gelisme=$(shuf -n 1 "gelisme.txt")
done
echo $gelisme

sonuc=$(shuf -n 1 sonuc.txt)
while [ -z "$sonuc" ]
do
sonuc=$(shuf -n 1 "sonuc.txt")
done
echo $sonuc

#Selected every line from txt files is writing to given txt file.
echo $giris > "$story"
echo $gelisme >> "$story"
echo $sonuc >> "$story"

exit 0
