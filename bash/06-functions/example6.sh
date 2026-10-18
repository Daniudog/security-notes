#!/bin/bash

# Example 5


check_number() {
	local n
	n=$1
	if [[ $n -gt 0 ]];
	then
		echo "$n is greater than zero"
	elif [[ $n -lt 0 ]];
	then
		echo "$n is lesser than zero"
	else
		echo "$n is zero"
	fi	
}


for n in 5 -3 0;
do
	check_number $n
done



# Notice we used n twice but both n variables are not the same.
# local variable n is the first argument given to the function when it is called i.e '$1' It only applies inside the function
# the other n is the variable we used to loop the numbers in the main program.
