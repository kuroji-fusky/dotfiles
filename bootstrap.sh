#!/bin/bash
read -p "Email plis: " email
read -p "Your name b0ss: " name

git config --global user.email "$email"
git config --global user.name "$name"

echo "Setting up custom aliases"
. './bash/aliases.sh'

echo "All set bitch"
