		if ! [ $# -eq 2 ]
		then
		echo "Please enter 2 argument !!!"; exit 3
		fi
		a="$1" #first argument
		length_1=${#a}

		b="$2" #second argument
		length_2=${#b}
		cond=0
			#error checks for inputs
			re_ex_word='^[A-Za-z]*$'
			re_ex_num='^[0-9]*$'
		if ! [[ $1 =~ $re_ex_word ]] ; then
		   echo "error: Please enter only first argument which only contains alphabet letters !!" >&2; exit 1
		fi
		if ! [[ $2 =~ $re_ex_num ]] ; then
		   echo "error: Please enter a number" >&2; exit 2
		fi

		#Creates own alphabet(for lowcase letters)
		for letter in {a..z}
			do
			lower_alphabet=$lower_alphabet$letter
			done
		#Creates own alphabet(for uppercase letters)
		for letter in {A..Z}
			do
			bigger_alphabet=$bigger_alphabet$letter
			done
		if [ $length_1 -eq 0 ] || [ $length_2 -eq 0 ]
		then
			echo string should not null
			exit 1
		fi
		if [ $length_1 -eq $length_2 ] #Setting cond for equal size condition
		then
			cond=0

		elif [ $length_2 -eq 1 ] #setting cond one number case
		then
			cond=1
		else
			echo invalid
		fi
		word=""

		for (( i=0 ; i < length_1 ; i++ ))
		do
			index=0; # it will find index of every letter in argument 1(a)

			for letter in {a..z} #Search in lowercase
			do
			if [[ "${a:i:1}" == "$letter" ]]
			then
			#after finding the index checks cond and increases the index
			if [[ cond -eq 0 ]]
				then
				test=$(($index+${b:i:1}))
				else
				test=$(($index+$b))
			fi
			if [[ $test -ge ${#lower_alphabet} ]] #checks index size
				then
					test=$(($test-${#lower_alphabet}))
				fi
			word=$word${lower_alphabet:$test:1} #adds new letters to a word
			fi
			index=`expr $index + 1`
			done
			index=0

			for letter in {A..Z} #Search in uppercase and same action again 
			do
			if [[ "${a:i:1}" == "$letter" ]]
			then
			if [[ cond -eq 0 ]]
				then
				test=$(($index+${b:i:1}))
				else
				test=$(($index+$b))
				fi

				if [[ $test -ge ${#bigger_alphabet} ]]
					then
						test=$(($test-${#bigger_alphabet}))
				fi
				word=$word${bigger_alphabet:$test:1}
			fi
			index=`expr $index + 1`
			done

		done
		echo $word
		exit 0
