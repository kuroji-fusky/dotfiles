#!/bin/bash

# TODO detect node/python environments
function clean() {
  read -p "clean project? (y/n)" yn

  if [ $yn = 'y' ]; then
    rm -rf node_modules
  fi
}
