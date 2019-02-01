if [[ ! $# -eq 0 ]]; then
	echo "Please do not enter arguments to this program !!!"; exit 30;
fi
mkdir -p writable #creates folder
codename=$0
location="$(pwd)/writable/*"
rm -fr $location #deletes everything in folder before start
location="$(pwd)/writable/"
count=0
for i in $(pwd)/*
do
	#echo "$i"
	if ! [ -d $i ] && [ -w $i ]
	then
		if [ "$i" == "$(pwd)${codename:1}" ] #we dont want to delete our own program :)
		then
		cp $i $location
		else
		mv $i $location
		fi
		count=$(($count+1)) 
	fi
done
echo "$count files moved to writable directory."

exit 0
