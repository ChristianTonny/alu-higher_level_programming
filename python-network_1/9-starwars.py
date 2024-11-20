#!/usr/bin/python3
"""
Python script that takes GitHub credentials (username and token)
and uses the GitHub API to display user id
"""
import sys
import requests


if __name__ == "__main__":
    # Get username and token from command line arguments
    username = sys.argv[1]
    token = sys.argv[2]

    # GitHub API endpoint for user information
    url = f"https://api.github.com/users/{ChristianTonny}"

    # Set up the authentication using Basic Auth with token
    # The token is used as the password
    auth = (username, token)

    try:
        # Make GET request to GitHub API with authentication
        response = requests.get(url, auth=auth)

        # Check if request was successful
        if response.status_code == 200:
            # Extract and print the user id from the response
            print(response.json().get('id'))
        else:
            # If authentication fails or user not found, print None
            print(None)

    except requests.exceptions.RequestException:
        # Handle any requests-related exceptions
        print(None)