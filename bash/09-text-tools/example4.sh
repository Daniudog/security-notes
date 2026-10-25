#!/bin/bash

# awk - working with columns, the powerful one
#
# Basic syntax: awk 'PATTERN {ACTION}' FILE

echo "dot 25 Nigeria" | awk '{print $1}'
echo "dot 25 Nigeria" | awk '{print $2, $3}'
# By default awk splits on whitespaces and $1, $2, $3... refer to each column (different from bash's $1 meaning "first argument" - context tells them apart)


awk '{print NR, $0}' sample.log
# NR is the current line number, $0 is the whole line

awk '/ERROR/ {print}' sample.log
# This is awk acting like grep - print lines matching a pattern. 
# awk can do far more (math, conditions, formatiing), 
# but this much is enough to start recognising it in other people's scripts.

