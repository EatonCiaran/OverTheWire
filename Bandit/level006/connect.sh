#! /bin/bash

usrn=bandit5
prev_level=005

# Solve for previous password if it's not known
if [ ! -f ../level$prev_level/solution.txt ]; then
	(cd ../level$prev_level/; ./solve.sh 1>/dev/null)
fi
pswd=$(< ../level$prev_level/solution.txt)

# Connect
sshpass -p $pswd ssh $usrn@bandit.labs.overthewire.org -p 2220
