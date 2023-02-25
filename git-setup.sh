#!/bin/bash
read -p "Email plis: " email
read -p "Your name b0ss: " name

ssh-keygen -t ed25519 -C "$email" -N "" -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.ignorecase false

echo "Setting up custom aliases"
. ./bash/aliases.sh

echo "All set bitch"