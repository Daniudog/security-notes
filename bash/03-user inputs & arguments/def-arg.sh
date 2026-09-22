# /bin/bash

# Default Argument
# A default value when an argument is missing


name=${1:-"stranger"}
echo "Hello, $name"

# ${1:-"stranger"} means "use $1 if it's set, otherwise use stranger".
# This avoids a script that prints "Hello, " with nothing after it.
