#!/bin/bash

# Create directory if it doesn't exist
mkdir -p python-everything_is_object

# Change to directory
cd python-everything_is_object

# Create and populate answer files
echo "type" > 0-answer.txt
echo "id" > 1-answer.txt
echo "No" > 2-answer.txt
echo "Yes" > 3-answer.txt
echo "Yes" > 4-answer.txt
echo "No" > 5-answer.txt
echo "True" > 6-answer.txt
echo "True" > 7-answer.txt
echo "True" > 8-answer.txt
echo "True" > 9-answer.txt
echo "True" > 10-answer.txt
echo "False" > 11-answer.txt
echo "True" > 12-answer.txt
echo "True" > 13-answer.txt
echo "[1, 2, 3, 4]" > 14-answer.txt
echo "[1, 2, 3]" > 15-answer.txt
echo "1" > 16-answer.txt
echo "[1, 2, 3, 4]" > 17-answer.txt
echo "[1, 2, 3]" > 18-answer.txt
echo "def copy_list(l):
    return l.copy()" > 19-copy_list.py
echo "Yes" > 20-answer.txt
echo "Yes" > 21-answer.txt
echo "No" > 22-answer.txt
echo "Yes" > 23-answer.txt
echo "True" > 24-answer.txt
echo "False" > 25-answer.txt
echo "True" > 26-answer.txt
echo "No" > 27-answer.txt
echo "Yes" > 28-answer.txt

# Make Python files executable
chmod +x 19-copy_list.py

# Git commands
git add .
git commit -m "Python everything is object tasks"
git push
