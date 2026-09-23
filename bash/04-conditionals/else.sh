#!/bin/bash

# Adding else

read -p "How old are you? " age

if [ "$age" -ge 18 ]; then
	echo "You are an adult."
else
	echo "You are a minor."
fi
