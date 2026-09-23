#!/bin/bash

# The modern test

name="Dot"
read -p "How old are you?: " age

if [[ "$name" == "Dot" && "$age" -ge 18 ]]; then
	echo "Welcome Adult $name"
else
	echo "You are a minor, $name"
fi


# [[ ]] is a safer, more flexible version of [ ]. 
# It handles && (and) and || (or) more reliably, and you'll see it a lot in real scripts. 
# We'll use [[ ]] from here on, but you should recognize [ ] too since it's everywhere in older scripts.
