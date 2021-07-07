#! /bin/bash

# Not exactly secure but details are already public
usrn=bandit0
pswd=bandit0

# Connect
sshpass -p $pswd ssh $usrn@bandit.labs.overthewire.org -p 2220