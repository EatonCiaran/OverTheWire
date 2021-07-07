#! /bin/bash

password=$(echo 'cat readme' | ./connect.sh | tail -n1)
echo ""

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
	echo "Probably failed to connect to the server. Issue likely to be a need to accept fingerprint."
	echo "Try this first: "
	echo "	ssh bandit0@bandit.labs.overthewire.org -p 2220"
fi
