#!/bin/bash

clear

# Change to user's home directory
cd $HOME

# Create $HOME/myScripts directory if not exist
if [ ! -d $HOME/myScripts ]; then
    mkdir -pv $HOME/myScripts
fi

# Change to $HOME/myScripts directory
cd $HOME/myScripts

# Delete any leftover files from previous runs.
if [ -d pihole.regex ]; then
    rm -R pihole.regex
fi

# Make user input case insensitive
shopt -s nocasematch

# Get user input
echo "Please input an option: [A]dd or [R]emove the whitelist.txt domains: "
read myChoice
if [[ $myChoice == "A" ]]; then
    clear
    git clone 'https://github.com/slyfox1186/pihole.regex.git'
    python3 'pihole.regex/scripts/install-exact-whitelist.py'
else
    clear
    git clone 'https://github.com/slyfox1186/pihole.regex.git'
    python3 'pihole.regex/scripts/uninstall-exact-whitelist.py'
fi