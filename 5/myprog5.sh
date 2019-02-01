
if [ $# -eq 1 ] #Checking total argument number
then
  path="."
elif [ $# -eq 2 ]
then
  path="$2"
else
  echo "Invalid number of arguments. You must enter 1 or 2 arguments"
  exit 50
fi

fileName="$1"
prev=""
if [ ! -d "$path" ] #Checks is the path is exist
then
  echo "The path \"$path\" does not exist !"
  exit 51
fi

num=0

for i in $(find "$path" -maxdepth 5 -name "$fileName" -type f ) #until depth 5 it search for suitable file names
do
num=$(( $num + 1 )) #counts the file which have found

if [[ -f $i ]]; then #if i is a file
  i="$prev $i"
  num=$(( $num + 1 )) #counts the file which have found, if is not only becase of spaces
echo "Do you want to delete "$i" ? (y/n)"
read answer
  if [[ "$answer" == "y" ]]; then
    rm -f "$i"
    echo "1 file deleted"
  elif [[ "$answer" == "n" ]]; then
    echo "File not deleted"
  fi

  prev=""
else
  prev="$i"  #it holds the i as prev because next run it will concat with space and other half of string
fi

done

if [[ $num -eq 0 ]]; then
  echo "There is no file named or expressed as \"$fileName\" "
fi

exit 0
