#!/bin/bash

# Redirecting errors seperately from normal output


# Every command has two seperate output streams: 
# stdout (normal output, stream 1)
# stderr (errors, stream 2)

ls output.txt doesnotexist.txt > out.txt 2> err.txt

# The result for output.txt will not produce an error so it has a stdout which is sent to out.txt 
# But because the doesnotexist.txt file does not exist, the command will send the standard error to the err.txt
#
# 2> sends error messages
# > sends normal output messages

# Another real usecase is the 2>/dev/null which sends error messages to a 'nowhere' file where it is silently discarded
# /dev/null is a special "nowhere" file used to hide error messages you don't care about.
