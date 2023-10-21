# Github_Api_Project
# GitHub Collaborators Lister

This Bash script allows you to list GitHub repository collaborators with read access using the GitHub API and a personal access token. It can be useful for checking who has permission to pull from a repository.

## Prerequisites

Before using this script, you need to ensure you have the following:

- [jq](https://stedolan.github.io/jq/): A lightweight and flexible command-line JSON processor. You can install it in your system if it's not already available.

## Usage

To use this script, follow these steps:

1. Ensure that you have the `jq` tool installed on your system.

2. Create a personal access token on GitHub with the necessary permissions (e.g., `read:org` and `repo`) and set it as the `TOKEN` environment variable.

   ```bash
   export TOKEN=your_personal_access_token
   export USERNAME=your_username
   
3. Execute the script with the following command-line arguments:
   ```
   ./your_script.sh <repository_owner> <repository_name>
