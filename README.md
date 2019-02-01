# bash_projectt

In this project, there five different shell script. Each script has different task.  
For testing each script there is a menu script main folder.  

1-----  
This shell script that takes two command line arguments, first one being a
string and the second one being a number. The number has to have a length of either 1 or
same as the string. Program will convert the input string into a ciphered one
using this number. For each letter in the string, program find another letter in
the English alphabet advancing over the alphabet corresponding digit times. For example:

Ex:  
$ ./myprog1.sh apple 12345  
brspj

Ex:  
$ ./myprog1.sh zoo 8  
hww

2-----  
Shell script takes a filename as parameter. Program will create a story copying one line from each one of the files named giris.txt, gelisme.txt, sonuc.txt
randomly in that order and print them to the file whose name is the argument given to the
program. If the file exists, it asks user if she wants the file to be overwritten.

Ex:  
$ ./myprog2.sh story1.txt  
story1.txt exists. Do you want it to be modified? (y/n): y  
A random story is created and stored in story1.txt.

3-----     
This shell script moves all the files with write permission for user to a directory
named writable. This directory will be created under current working directory by program.

Ex:  
$ myprogr3.sh  
7 files moved to writable directory.  

4-----  
This shell script takes an integer argument. TProgram finds the
hexadecimal values for all prime numbers that are smaller than the argument.  

Ex:  
$ ./myprog4.sh 10  
Hexadecimal of 2 is 2  
Hexadecimal of 3 is 3  
Hexadecimal of 5 is 5  
Hexadecimal of 7 is 7  

5-----  
This shell script takes a wildcard as an argument and a pathname to a
directory as an optional argument. If the user supplies only wildcard as an argument, then
the program asks user to delete every file whose name obeys the wildcard under
current directory. If the user supplies both wildcard and pathname, then the program
asks user to delete every file whose name obeys the wildcard under the given directory and
all of its subdirectories.  

Ex:  
$ myprogr5.sh s*  
Do you want to delete song-of-hiawatha.txt? (y/n): y  
1 file deleted  
$ myprogr5.sh s* .  
Do you want to delete shakespeare.txt? (y/n): y  
1 file deleted  
