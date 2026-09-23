#!/bin/bash

# elif conditions

read -p "What did you score? " grade

if [ "$grade" -ge 90 ]; then
	echo "Grade: A"
elif [ "$grade" -ge 70 ]; then
	echo "Grade: B"
elif [ "$grade" -ge 60 ]; then
	echo "Grade: C"
elif [ "$grade" -ge 45 ]; then
	echo "Grade: D"
else
	echo "Grade: F"
fi

# Bash checks each condition top to bottom and stops at the first one that's true.
