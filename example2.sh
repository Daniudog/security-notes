#!/bin/bash


# Example 2

# Passing arguments into a function
greet(){
	echo "Hello $1"
}

# calling the function with arguments
greet "Dot"
greet "World"
