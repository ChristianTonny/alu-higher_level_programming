#!/bin/bash
# Takes in a URL, sends a request, and displays the size of the body
curl -sI "$1" | grep -i Content-Length | awk '{print $2}'
