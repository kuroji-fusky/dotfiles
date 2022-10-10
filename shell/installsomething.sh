#!/bin/bash

if ! command -v handbrake-cli &> /dev/null
then
  echo 'ffmpeg cannot be found'
  exit
  else
  echo 'yes it found it'
fi