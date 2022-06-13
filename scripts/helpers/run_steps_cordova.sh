#!/bin/bash

# $1 - Version of dependency
# $2 - Dependency

red_square="<span style='color:red; height: 100px; width: 100px;'>&#9632;</span>"
green_square="<span style='color:green; height: 100px; width: 100px;'>&#9632;</span>"
yellow_square="<span style='color:yellow; height: 100px; width: 100px;'>&#9632;</span>"

echo "============ Start ============"
echo "Building npm-package"
make build-npm-package
if [ $? -eq 0 ]; then
  page_content_agent="<p> Build for Cordova agent with $4 version $1: pass $green_square</p>"
  echo "Building Cordova Every Feature"
  make build-ef-cordova
  if [ $? -eq 0 ]; then
    page_content_ef_cordova="<p> Build for EF Cordova app with $4 version $1: pass $green_square</p>"
    echo "Running Cordova sanity tests"
    make run-cordova-sanity-suite-tests
    if [ $? -eq 0 ]; then
      page_content_sanity_cordova_tests="<p> Cordova Sanity tests: pass $green_square</p>"
    else
      echo "ERROR: Sanity tests for Cordova failed."
      page_content_sanity_cordova_tests="<p> Cordova Sanity tests: fail $red_square</p>"
    fi
  else
    page_content_ef_cordova="<p> Build for EF Cordova app with $4 version $1: fail $red_square</p>"
    page_content_sanity_cordova_tests="<p> Cordova Sanity tests: No run because previous fail</p>"
    echo "ERROR: Build EF Cordova failed"
  fi
else
  page_content_agent="<p> Build for Cordova agent with $4 version $1: failed $red_square </p>"
  page_content_ef_cordova="<p> Build for EF Cordova app with $4 version $1: No run because previous step failed $yellow_square</p>"
  page_content_sanity_cordova_tests="<p> Cordova Sanity tests: No run because previous step fail $yellow_square</p>"
  echo "ERROR: Build NPM Package failed"
fi

build_url_content="<p> <a href='"${BUILD_URL}"'>Link to TeamCity Build</a> </p>"
content="${page_content_agent} ${page_content_ef_cordova} ${page_content_sanity_cordova_tests} ${build_url_content}"

source ./scripts/helpers/confluence.sh

# $1 - version
# $2 - dependency name
echo "Creating the results confluence page "
check_and_create_confluence_page "$2" "$content" "$1"
echo "============ End ============"