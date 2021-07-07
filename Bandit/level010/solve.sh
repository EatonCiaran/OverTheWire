#! /bin/bash

# Get strings from file, find lines with ===, remove non-text
password=$(echo 'strings data.txt | grep == | sed "s/&=*\s//"' | ./connect.sh 2>/dev/null | tail -n1 )

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
fi