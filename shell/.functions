#!/bin/sh

# WIP -- Force kills a network port, defaults to kill localhost 3000, 4000, 5500, 5173, 8000, and 8080
kill-port() {}

# Installs node or python stuff with ease
setup-repo() {
  repo=$1

  if ! [[ $repo == "git@github.com:"* || $repo == "https://github.com/"* ]]; then
    echo "Not a valid GitHub repository URL!"
    return 1
  fi

  git clone "$1" -v
  repo_folder=$(basename "$1" ".git")

  cd "$repo_folder" || return 1

  # Check project type
  if [[ -f package.json ]]; then
    case 1 in
    $([[ -f package-lock.json ]]))
      echo "NPM lockfile detected"
      npm install
      ;;
    $([[ -f yarn.lock ]]))
      echo "Yarn lockfile detected"
      yarn install
      ;;
    $([[ -f pnpm-lock.yaml ]]))
      if [[ $(npm list -g | grep -c pnpm) -eq 0 ]]; then
        echo "PNPM not installed, installing right now"
        npm i -g pnpm
      fi

      echo "PNPM lockfile detected"
      pnpm install
      ;;
    *)
      echo "No lockfile(s) detected; fallback to Yarn"
      yarn install
      ;;
    esac

  elif [[ -f requirements.txt ]]; then
    pip install -r requirements.txt
  else
    echo "Environment not detected"
  fi

  cd .
  echo "Project bootstrap complete!"
}

alias setup-repo="setup-project"

clean() {
  junk=(
    node_modules
    __pycache__
    .next
    .out
    .nuxt
    .turbo
    build
    dist
    out
  )

  read -p "clean project? (y/n)" yn

  if [ $yn == 'y' ]; then
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

rename-branch() {
  if [ $# -ne 2 ]; then
    echo "Usage: rename-branch <old_branch> <new_branch>"
    return 1
  fi

  old_branch="$1"
  new_branch="$2"

  git branch -m "$old_branch" "$new_branch"
  git fetch origin -v
  git branch -u "origin/$new_branch" "$new_branch" -v
  git remote set-head origin -a
}

alias rnb="rename-branch"
