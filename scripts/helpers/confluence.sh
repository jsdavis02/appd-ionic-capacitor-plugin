#!/bin/bash

# Display info about the operating system
OS=$(uname)

if [ "$OS" == 'Darwin' ]; then
  brew install jq || :
else
  sudo apt-get install jq || :
fi

username="${CONFLUENCE_AUTOMATION_USER}"
user_token="${CONFLUENCE_AUTOMATION_PASSWORD}"
confluence_url="https://confluence.corp.appdynamics.com"

# Desired tree structure in confluence
# Dependency testing (parent page) - existing page
#    - Appium (child page) - existing page
#       - Current Date (child page)
#           - Run current datetime (end of tree page)
#           - Run current datetime (end of tree page)
#       - Current Date + 1
#           - - Run current datetime + 1 (end of tree page)
#    - Gradle (child page) - existing page
#       - Current Date (child page)
#           - Run current datetime (end of tree page)
#           - Run current datetime (end of tree page)
#       - Current Date + 1
#           - Run current datetime + 1 (end of tree page)


# Usage: get_content_id "my_page_title"
function get_content_id() {
  curl -G -u "$username":"$user_token" \
      --request GET \
      --url "${confluence_url}"'/rest/api/content' \
      --data-urlencode "spaceKey=EUM" \
      --data-urlencode "title=$1" \
      --header 'Accept: application/json' | jq -r '.results[] | .id'
}

# Get descendants title for a parent page
# $1 - ancestor ID
function get_childs() {
  curl -u "$username":"$user_token" \
      --request GET \
      --url "${confluence_url}"'/rest/api/content/'$1'/child?expand=page' \
      --header 'Accept: application/json' | jq -r ".page.results[] | .title"
}

# Params:
# - $1 ancestor id
# - $2 page title
# - $3 Body->storage->value - content within the page
function create_confluence_page() {
  # Ancestor ID will be the parent page for the Dependency (i.g. Appium)
  curl -u "$username":"$user_token" \
      --request POST \
      --url "$confluence_url"'/rest/api/content' \
      --header 'Accept: application/json' \
      --header 'Content-Type: application/json' \
      --data '{
        "title": "'"$2"'",
        "type": "page",
        "space": {
          "key": "EUM"
        },
        "ancestors": [
          {
            "id": "'"$1"'"
          }
        ],
        "status": "current",
        "body": {
          "storage": {
            "value": "'"$3"'",
            "representation": "storage"
        }}}'
}

# $1 - is the name of the parent page. Example: Appium, Gradle
# $2 - is the content to publish inside the confluence page
# example for content:   page_content_agent="<p> Build for Cordova agent with version $VER: $failed red_square </p>"
# $3 - is the version
function check_and_create_confluence_page() {
  current_date="$(date '+%Y-%m-%d') Cordova-Ver-$3"
  current_datetime=$(date)

  parent_id=$(get_content_id "$1")
  title_list=( "$(get_childs "$parent_id")" )
  version_agent_type="Cordova-$3"

  if [[ "${title_list[*]}" =~ (^|[[:space:]])"$version_agent_type"($|[[:space:]]) ]] ; then
    ancestor_id=$(get_content_id "$version_agent_type")
    date_page_list=( "$(get_childs "$ancestor_id")" )

    if [[ "${date_page_list[*]}" =~ (^|[[:space:]])"$current_date"($|[[:space:]]) ]] ; then
      current_page_id=$(get_content_id "$current_date")
      create_confluence_page "$current_page_id" "$current_datetime" "$2"
    else
      create_confluence_page "$ancestor_id" "$current_date" "TBD"
      current_page_id=$(get_content_id "$version_agent_type")
      create_confluence_page "$current_page_id" "$current_datetime" "$2"
    fi
  else
    create_confluence_page "$parent_id" "$version_agent_type" "TBD"
    ancestor_id=$(get_content_id "$version_agent_type")
    create_confluence_page "$ancestor_id" "$current_date" "TBD"
    current_page_id=$(get_content_id "$current_date")
    create_confluence_page "$current_page_id" "$current_datetime" "$2"
  fi
}