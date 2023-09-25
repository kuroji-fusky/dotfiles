#!/bin/bash

validate-package() {
}

# WIP -- Force kills a network port, defaults to kill localhost 3000, 4000, 5500, 5173, 8000, and 8080
kill-port() {}

# Installs node or python stuff with ease
setup-project() {
  repo=$1

  if [[ repo != https://github.com/* || repo != git@github.com/* ]]; then
    echo "Not a valid GitHub repository URL!"
    return 1
  fi

  git clone "$1" -v
  repo_folder=$(basename "$1" ".git")
  cd "$repo_folder" || return 1

  # Check project type
  if [[ -f package.json ]]; then
    if [[ -f package-lock.json ]]; then
      npm install
    elif [[ -f yarn.lock ]]; then
      yarn install
    elif [[ -f pnpm-lock.yaml ]]; then
      pnpm install --no-shamefully-hoist
    else
      yarn install
    fi
  elif [[ -f requirements.txt ]]; then
    pip install -r requirements.txt
  else
    echo "Environment not detected"
  fi

  echo "Project bootstrap complete!"
}

alias ki="setup-project"

junk=(
  node_modules
  __pycache__
  .next
  .out
  .nuxt
  .turbo
  dist
  out
)

clean() {
  read -p "clean project? (y/n)" yn

  if [ $yn = 'y' ]; then
    rm -rdfv ${junk[@]}
    echo "All done!"
  fi
}

# Taken from https://github.com/yyx990803/dotfiles/blob/master/bash/.functions#L57
extract() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar -jxvf $1 ;;
    *.tar.gz) tar -zxvf $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar -xvf $1 ;;
    *.tgz) tar -zxvf $1 ;;
    *.zip) unzip $1 ;;
    *.ZIP) unzip $1 ;;
    *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

rm-ext() {
  for file in $0; do
    rm -v "$file"
  done
}

# A simple wrapper for `yt-dlp`
ytd() {
  # check for updates first
  pip --install yt-dlp -U

  # do some crazy arg parsing shit here
}

update-branch() {
  if [ $# -ne 2 ]; then
    echo "Usage: update-branch <old_branch> <new_branch>"
    return 1
  fi

  old_branch="$1"
  new_branch="$2"

  git branch -m "$old_branch" "$new_branch" -v
  git fetch origin -v
  git branch -u "origin/$new_branch" "$new_branch" -v
  git remote set-head origin -a -v
}

alias upb="update-branch"
