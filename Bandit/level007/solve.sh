#! /bin/bash

file=$(echo "find / -user bandit7 -group bandit6 -size 33c 2>/dev/null" | ./connect.sh 2>/dev/null | tail -n1)
password=$(echo "cat $file" | ./connect.sh 2>/dev/null | tail -n1 )

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
fi