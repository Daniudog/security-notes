#!/bin/bash
echo "Hello Friend"

sleep 2

read -p "What is your username?: " username

read -sp "Create password: " password

read -sp "Confirm password: " passwd
if [[ $password == $passwd ]]; then
	echo "password saved"
else
	echo "password mismatch"
	exit
fi


sleep 5

read -p "Login: Y/N: " start

if [[ $start == "y" ]]; then
	echo "Hi $username."
	sleep 3
	read -p "Enter your password: " PASSWORD
	if [[ $PASSWORD == $password ]]; then
		echo "Welcome $username"
	else
		echo "Incorrect password"
	fi
elif [[ $start == "n" ]]; then
	echo "Goodbye"
	exit

else
	echo "Something went wrong"
	exit
fi
