#!/bin/bash

# Example 5

# Local variables

counter=100

add_one() {
	local counter # without this, counter below would overwrite the outer one
	counter=1
	echo "inside function: $counter"
}


# displaying both variables to see the difference

add_one # displaying the counter variable inside function

echo "outside function: $counter" # displaying the counter variable outside function
