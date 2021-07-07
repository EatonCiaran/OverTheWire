#! /bin/bash

password=$(echo 'cat ./-' | ./connect.sh 2>/dev/null | tail -n1)

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
fi