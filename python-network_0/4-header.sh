#!/bin/bash
# Send a GET request with a header, and output verbose response for debugging.
curl -v -H "X-HolbertonSchool-User-Id: 98" "http://$1"
