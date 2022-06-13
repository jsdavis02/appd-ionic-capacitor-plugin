#!/usr/bin/env bash

# Function to check if a dependency exists and if not to install it
function install_utils(){
  case "$1" in
  "node" )
          "$1" -v
          if [ $? -eq 0 ]; then
            echo "# $1 already installed"
          else
            echo "# Installing $1 ..."
            install_if_not_present "$1"
          fi
  ;;
  "cordova" )
          "$1" --version
          if [ $? -eq 0 ]; then
            echo "# $1 already installed"
            v1=$("$1" --version)
	          v2="$2"
	          if [ "$v1" == "$v2" ]; then
	            echo "# $1 version $2 is already installed"
            else
              echo "# Uninstalling $1 $v1..."
              npm uninstall -g "$1"
              echo "# Installing $1 $2 ..."
              install_if_not_present "$1"
            fi
          else
            echo "# Installing $1 $2..."
            install_if_not_present "$1"
          fi
  ;;
  esac
}

# Function to install specific dependency
function install_if_not_present(){
   case "$1" in
  "node" )nvm install "$1"
   ;;
  "cordova" )npm install -g "$1" "$2"
   esac
}

# Package of items needed for successfully Cordova installation
PACKAGES=(
 node
 cordova
)

for packages in "${PACKAGES[@]}"
  do
   if [ "$packages" == "cordova" ]; then
      install_utils "${packages}" "$1"
    else
      install_utils "${packages}"
    fi
done


cd ../../
# $1 - version
# $2 - dependency
# $4 - Agent type. Example Cordova Agent
#TODO - Check sanity tests when the component tests will be working (those are currently disabled)
#bash ./scripts/helpers/run_steps_cordova.sh "$1" "Cordova Framework Dependency" "$4" "$2"

#Adding test-result file in order to fix AggregateTests job
mkdir -p build/test-results
echo "# Tests are disabled" > build/test-results/test-result.txt
