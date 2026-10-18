#!/bin/bash

# Example 4

is_even() {
	if (( $1 % 2 == 0 ));then
		return 0 # 0 means "success" / true
	else
		return 1 # non-zero means "failure" / false
	fi
}

if is_even 4;
then
	echo "4 is even"
fi
