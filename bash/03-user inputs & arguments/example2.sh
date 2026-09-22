#! /bin/bash
# Putting the prompt on the same line

read -p "What is your favourite language? " lang
echo "Nice, $lang is great"

# -p shows a prompt without needing a separate echo. 
# Notice the space inside the quotes, before the closing "  
# without it, your typing runs into the prompt text.
