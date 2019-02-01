error_output=""
cond=0
for i in {1..5}  #checking for the folders are exist.
do
  if [[ ! -d ./$i ]]; then
    echo "Something wrong ./$i folder does not exist"
    cond=1
  fi
done

for i in {1..5} #checking for programs are exixst
do
  if [[ ! -f ./$i/myprog$i.sh ]]; then
    echo "Something wrong ./$i/myprog$i.sh does not exist"
    cond=1
  fi
done

for i in {1..5}  #checking programs are exacutable
do
  if [[ ! -x ./$i/myprog$i.sh ]]; then
    chmod +x ./$i/myprog$i.sh
  fi
done

if [[ cond -eq 1 ]]; then
  exit 1
fi
cond=0
while [ $cond -eq 0 ]
do
echo "$error_output"
echo "Please select an option:"
echo "1.Cipher word"
echo "2.Create story"
echo "3.Move files"
echo "4.Convert hexadecimal"
echo "5.Delete files"
echo "6.Exit"
read input
  case "$input" in
    "1" | "2" | "4" | "5") #these questions neads arguments
    set -f   #For prevent the wildcart expension
    cd $input  #we seperate every program in diffrent folder to prevent programs to affect each other
    error_cond=1
    while [[ $error_cond != 0 ]]; do
    if [[ $input == "5" ]]; then
      echo "You are in menu. You do not enter arguments in double quotes"
    fi
    echo "Please enter arguments in one line for myprog$input.sh:"
    read arguments
    #arguments=$(echo "$arguments" | tr -d \")
    #If you want to enter double quotes delete the comment sign of upper line
    ./myprog$input.sh $arguments
    error_cond=$? #if program exit with eror code it will dont exit the loop
    set +f
    done
    cd ..

      ;;
    "3" ) # it works
      cd 3
      ./myprog3.sh
      cd ..
      ;;
    "6" )
    cond=1
      ;;
    * )
      echo "Invalid option please enter valid option "
      ;;

  esac
done
