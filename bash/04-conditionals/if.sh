#!/bin/bash

# The basic if

read -p "How old are you? " age

if [ "$age" -ge 18 ]; then
	echo "You are an adult"
fi

# [ ... ] is a test. -ge means "greater than or equal to".
# then starts the block that runs if the test passes.
# fi (if backwards) closes the block.
