#!/bin/bash

# Text tools ( grep, cut, sed, awk )


# creating sample.log to test this example
echo "There is an Error" >> sample.log 
echo "ERROR: your kernel bootloader faled during the load" >> sample.log
echo "check the warning message for the error INFO" >> sample.log
echo "WARNING: rebbot the system again" >> sample.log


# grep - finding lines

grep "ERROR" sample.log  # lines containing ERROR
grep -i "error" sample.log # case-insensitive
grep -v "INFO" sample.log # Invert: lines not containing INFO
grep -c "ERROR" sample.log # just the count
grep -n "ERROR" sample.log # show line numbers too
grep -E "ERROR|WARNING" sample.log # match either word ( -E = extended regex )
