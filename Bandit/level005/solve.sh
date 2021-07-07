#! /bin/bash

file=$(echo "file inhere/*" | ./connect.sh 2>/dev/null | grep ASCII | grep -o ".*:" | sed s/://)
password=$(echo "cat $file" | ./connect.sh 2>/dev/null | tail -n1)

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
fi