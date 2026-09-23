#!/bin/bash
# For numerical comparison

read -p "Enter a number x: " x

if [ "$x" -eq 10 ]; then echo "x is 10"; fi
if [ "$x" -ne 10 ]; then echo "x is not equal to 10"; fi
if [ "$x" -gt 10 ]; then echo "x is greater than 10"; fi
if [ "$x" -lt 10 ]; then echo "x is less than 10"; fi
if [ "$x" -ge 10 ]; then echo "x is greater than or equal to 10"; fi
if [ "$x" -le 10 ]; then echo "x is less than or equal to 10"; fi


# When you write the whole conditional test on the same line:
# Always remember to add another semi-colon at the end of the condition, 
# immediately before the fi

# Number comparisons

# -eq    equal
# -ne    not equal
# -gt    greater than
# -lt    less than
# -ge    greater than or equal
# -le    less than or equal
