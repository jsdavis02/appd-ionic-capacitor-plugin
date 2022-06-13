#!/usr/bin/env bash

set -e # exit on error

version=$1

# Function to check if a dependency exists and if not to install it
function install_utils() {
  case "$1" in
  "nvm")
    if nvm --version; then
      echo "# $1 is installed"
    else
      echo "# There is no nvm installed"
      echo "# Installing $1 "
      install_if_not_present "$1"
    fi
    ;;
  "node")
    if node --version; then
      echo "# $1 is installed"
    else
      echo "# There is no node installed"
      echo "# Installing $1 version $version ..."
      nvm install $version
    fi
    ;;
    "npm")
    if npm --version; then
      v1=$(node --version)
      if [ $v1 == "v"$version ]; then
        echo "# $1 is installed"
      else
        echo "# Installing $1 "
        install_if_not_present "$1"
      fi
    else
      echo "# There is no npm installed"
      echo "# Installing $1 "
      install_if_not_present "$1"
    fi
    ;;
  esac
}

function install_if_not_present() {
  case "$1" in
  "nvm")
    touch ~/.zshrc
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    ;;
    "npm")
      npm install npm@$version -g
    ;;
  esac
}

# Package of items needed for cocoapods successfully  installation
PACKAGES=(
  nvm
  node
  npm
)

for package in "${PACKAGES[@]}"; do
  install_utils "${package}"
done

cd ../../
# $1 - version
# $2 - dependency
# $4 - Agent type. Example Cordova Agent
#TODO - Check sanity tests when the component tests will be working (those are currently disabled)
#bash ./scripts/helpers/run_steps_cordova.sh "$1" "NPM Dependency" "$4" "$2"

#Adding test-result file in order to fix AggregateTests job
mkdir -p build/test-results
echo "# Tests are disabled" > build/test-results/test-result.txt