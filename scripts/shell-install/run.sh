#!/bin/bash

clear

# Make user input case insensitive
shopt -s nocasematch

# Set directory variable
SHELL_FILES="exact-blacklist.sh exact-whitelist.sh regex-blacklist.sh regex-whitelist.sh"
FILE_DIR="$HOME/pihole.regex"

# Delete: The useless index.html file
if [ -f index.html ]; then
    rm index.html
fi

# Create: $FILE_DIR directory if not exist
if [ ! -d $FILE_DIR ]; then
    mkdir -p "$FILE_DIR"
fi

# Verify: If files exist and move them to $HOME/pihole.regex
FILES1=($SHELL_FILES run.sh)

for i in ${FILES1[@]}; do
  if [ -f $i ]; then
      mv "$i" "$FILE_DIR/$i"
  else
      echo -e "Failed to download: $i\\n"
  fi
done

echo
read -p 'Press enter to exit...'
clear

FILES2=($SHELL_FILES)

for i in ${FILES2[@]}; do
    . "$FILE_DIR/$i"
done
