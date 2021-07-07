#! /bin/bash

# NOT SOLVED

tmp=$(echo "mktemp -d" | ./connect.sh 2>/dev/null | tail -n1 )
#echo "Tempdir: $tmp"

bin_file=$(echo "xxd -r data.txt > $tmp/bin.gz" | ./connect.sh 2>/dev/null | tail -n1 )
bin_file=$(echo "gzip -d $tmp/bin.gz" | ./connect.sh 2>/dev/null | tail -n1 )
bin_file=$(echo "bzip2 -d $tmp/bin" | ./connect.sh 2>/dev/null | tail -n1 )

bin_file=$(echo "mv $tmp/bin.out $tmp/bin2.gz" | ./connect.sh 2>/dev/null | tail -n1 )
bin_file=$(echo "gzip -d $tmp/bin2.gz" | ./connect.sh 2>/dev/null | tail -n1 )

password=$(echo 'cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m' | sed "s/.*\s//g"' | ./connect.sh 2>/dev/null | tail -n1 )

if [ -n "$password" ]; then
	echo "Password: $password"
	printf "%s" "$password" > solution.txt
else
	echo "No password found."
fi