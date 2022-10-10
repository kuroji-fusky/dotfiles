#!/bin/bash

if ! command -v handbrake-cli &> /dev/null
then
  echo 'ffmpeg cannot be found'
  exit
  else
  echo 'yes it found it'
fi

# if hash handbrake-cli 2>/dev/null; then
#     echo "lmao"
#   else
#     echo "handbrake-cli is not installed on your system. Installing..."
#     # sudo apt-get install handbrake-cli -y
# fi

# if hash handbrake-gtk 2>/dev/null; then
#     echo "lmao"
#   else
#     echo "handbrake-gtk is not installed on your system. Installing..."
#     # sudo apt-get install handbrake-gtk -y
# fi

