#! /bin/bash
# Hide secret input for passwords

read -sp "Enter a secret word: " secret
echo 
echo "Got it. But I won't show it"

# -s (silent) stops the typed text from appearing on screen. 
# The bare echo after just moves to a new line, 
# since Enter isn't visible either with -s.
