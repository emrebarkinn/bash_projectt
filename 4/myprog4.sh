
#!/bin/bash
if [[ ! $# -eq 1 ]]; then
  echo "Invalid number of arguments please enter only 1 argument !!"; exit 40
fi
prime_1=0
n=$1

#Argument type control
re='^[0-9]+$'
if ! [[ $n =~ $re ]] ; then
   echo "error: Invalid" >&2; exit 41
fi

if [ $n -le 2 ]; then
exit
fi
#Converting decimal to hexadecimal
echo "Hexadecimal of 2 is `echo "obase=16; 2" | bc`"

#Finding smaller prime numbers from given number.
for((i=3;i<=n;))
do
for((j=i-1;j>=2;))
do
if [  `expr $i % $j` -ne 0 ] ; then
prime_1=1
else
prime_1=0
break
fi
j=`expr $j - 1`
done
if [ $prime_1 -eq 1 ] ; then

#Converting decimal to hexadecimal
echo "Hexadecimal of $i is `echo "obase=16; $i" | bc` "
fi
i=`expr $i + 1`
done

exit 0
