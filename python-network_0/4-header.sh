#!/bin/bash
# Send a GET request with a header to the correct route
curl -s -H "X-HolbertonSchool-User-Id: 98" "http://$1/route_5"
