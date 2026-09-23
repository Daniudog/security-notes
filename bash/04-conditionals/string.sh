#!/bin/bash

# String comparisons

read -p "Enter your favourite color: " color

if [ "$color" == "red" ]; then echo "Your favourite color is red"; fi

if [ "$color" != "red" ]; then echo "Your favourite color is not red"; fi


# Important: -eq is for numbers, == is for strings. Mixing them up is a very common bash bug.
# == checks equality
# != means not equal to
