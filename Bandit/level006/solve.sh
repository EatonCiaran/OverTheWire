#! /bin/bash

file=$(echo "find -size 1033c" | ./connect.sh 2>/dev/null | tail -n1)
password=$(echo "cat $file" | ./connect.sh 2>/dev/null | tail -n2 | sed s/\ //g)

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
fi