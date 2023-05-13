#!/bin/bash

# Installs node or python stuff with ease
ki() {
  if [[ $1 != https://github.com/* ]]; then
    echo "Not a valid GitHub repository URL!"
    return 1
  fi

  git clone "$1"
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

clean() {
  read -p "clean project? (y/n)" yn

  if [ $yn = 'y' ]; then
    rm -rdf node_modules __pycache__
    echo "All done!"
  fi
}

# Taken from https://github.com/yyx990803/dotfiles/blob/master/bash/.functions#L57
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)  tar -jxvf $1                        ;;
      *.tar.gz)   tar -zxvf $1                        ;;
      *.bz2)      bunzip2 $1                          ;;
      *.dmg)      hdiutil mount $1                    ;;
      *.gz)       gunzip $1                           ;;
      *.tar)      tar -xvf $1                         ;;
      *.tgz)      tar -zxvf $1                        ;;
      *.zip)      unzip $1                            ;;
      *.ZIP)      unzip $1                            ;;
      *)          echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}