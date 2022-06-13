#!/usr/bin/env bash

cd scripts/ || exit

# Configure
set -e
source ./helpers/parse_yaml.sh

echo
echo "# Reading property from yaml file"
echo

# Execute
create_variables dependenciesVersions.yml


## declare an array variable
declare -a version_list

case "$1" in
  "cordova")
  version_list="${cordova_versions[*]}"
;;
  "node")
  version_list="${node_versions[*]}"
;;
  "npm")
  version_list="${npm_versions[*]}"
;;
esac

## now loop through the above array
for version in $version_list
do
  dependency="install_$1.sh"

  echo "Navigating to dependency_installation folder"
  cd dependency_installation/ || exit
  echo "Running dependency script: $dependency with version $version"
  bash "$dependency" "$version" "$1" "Cordova Agent"
  cd ..
done