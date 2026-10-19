#!/bin/bash

# Getting parts of a path


path="/home/dot/bashscripting/19-10-2026/revision.sh"

echo "$(basename "$path")" # returns just the filename
echo "$(dirname "$path")" # returns just the directory/folder name
