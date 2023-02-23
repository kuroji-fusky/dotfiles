#!/bin/bash

# Update stuff
apt-get update -y
apt-get upgrade -y

# Install python and git
apt install git python3 python3-pip -y

# Alias command "python" and "py"
printf -e "\nalias {py,python}=python3" >>~/.bashrc
source ~/.bashrc

# Install Node version manager
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

export NVM_DIR="$HOME/.nvm" &&
  [ -s "$NVM_DIR/nvm.sh" ] &&
  \. "$NVM_DIR/nvm.sh" &&
  [ -s "$NVM_DIR/bash_completion" ] &&
  \. "$NVM_DIR/bash_completion"

# Install LTS for Node.js
nvm install --lts

# Install yarn package manager
npm i -g yarn
