#!/bin/bash
#Helper function to handel incorrect number of command line arguments
function Helper {
    expected_cmd_args=2
    given_args=$1

    if [ "$given_args" -ne "$expected_cmd_args" ]; then
        echo "$expected_cmd_args arguments required, but only $given_args present"
        exit 1
    fi
}

# Call the Helper function to check the number of command-line arguments
Helper $#

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$USERNAME
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository
function list_users_with_read_access {

    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access