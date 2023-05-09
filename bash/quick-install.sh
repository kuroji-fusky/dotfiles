#!/bin/bash

IFS='/'
read -a parseRepo <<< "$1"

# TODO Check if it's a valid git repo url
echo ${parseRepo[2]}
echo ${parseRepo[4]}

NPM_LOCK_FILE="package-lock.json"
PNPM_LOCK_FILE="yarn.lock"
YARN_LOCK_FILE="pnpm-lock.yaml"

if [[ -f "package.json" ]]; then
  echo "node.js env detected"

  if [[ -f $NPM_LOCK_FILE ]]; then
    echo "npm detected"
    npm install
  elif [[ -f $YARN_LOCK_FILE ]]; then
    echo "yarn detected"
    yarn install
  elif [[ -f $PNPM_LOCK_FILE ]]; then
    echo "pnpm detected"
    pnpm install
  else
    echo "Node detected; couldn't detect environment"
  fi
elif [[ -f "*.py" && -f "/requirements.txt" ]]; then
  echo "python env detected, installing..."
  pip install -r requirements.txt
else
  echo "inside git repo but there's nothing lol"
fi
