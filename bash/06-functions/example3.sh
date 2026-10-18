#!/bin/bash

# Example 3

# Returning a value with functions

make_greeting() {
	echo "Hello $1"
}

# Returning the function value
result=$(make_greeting "Dot")
echo "$result"
