#!/bin/bash

# Default ENV settings
TARGET_DIR=home/
SEPERATOR=-----------------------------------
SALT=linux

LAST_USER_NUMBER=$(ls $TARGET_DIR | nl | awk -F ' ' 'END {print $1}')

NEW_USER="user-$((LAST_USER_NUMBER + 1))"
NEW_USER_PASSWORD=$(echo "SEED" | openssl passwd -1 -stdin)

# Adding new user to the server.
# ONLY STDERR can be seen in this command.
sudo useradd -m -p $NEW_USER_PASSWORD $NEW_USER > /dev/null 2>&1

# Generate user information
echo $SEPERATOR >> users
echo $NEW_USER >> users
echo $NEW_USER_PASSWORD >> users
echo $SEPERATOR >> users
