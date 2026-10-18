#!/bin/bash

# Example 7
# break and continue
# If the logic I used is too confusing, comment out any section of the script you do not want to run

# ------- continue -----------

# 1. With a while loop
n=1
while [[ n -le 10 ]]
do
	echo "n is $n"
	n=$(( n + 1 ))

	if [[ $n -eq 5 ]];
	then
		sleep 1 
		echo "You are half way to the end"
	fi
	continue
done


# 2. With a for loop

for i in {1..10}
do
	if [[ $i -eq 4 ]];
	then
		continue # This will skip 4
	fi

	echo "i is $i"
	i=$((i + 1))
done






# ---------- break --------------

# In the second example, adding break will end the condition before it completes the range


# Added this part to indicate what part of the code is running
sleep 3

echo "The break and continue part" 

# The code
for i in {1..10}
do
	if [[ $i -eq 4 ]];
	then
		echo "$i will be skipped"
		continue
	fi
	
	if [[ $i -eq 7 ]];
	then
		echo "The loop has to stop at $i"
		break # This stops the loop at 7 before it reaches 10
	fi

	# when i is non of those numbers the loop continues
	# at 4 the loop continues with this part
	# at 7 the loop breaks before getting to this part
	echo "i is $i"
	i=$(( i + 1 ))
done
