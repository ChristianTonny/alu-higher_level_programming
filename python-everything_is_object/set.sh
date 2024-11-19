#!/bin/bash

# Create Python files
echo 'def magic_string():
    magic_string.count = getattr(magic_string, "count", 0) + 1
    return ", ".join(["BestSchool"] * magic_string.count)' > 100-magic_string.py

echo 'class LockedClass:
    __slots__ = ["first_name"]' > 101-locked_class.py

# Create answer files for Task 32
echo "1" > 103-line1.txt
echo "0" > 103-line2.txt

# Create answer files for Task 33
echo "1" > 104-line1.txt
echo "0" > 104-line2.txt
echo "No" > 104-line3.txt
echo "Yes" > 104-line4.txt
echo "1" > 104-line5.txt

# Create answer file for Task 34
echo "262" > 105-line1.txt

# Create answer files for Task 35
echo "1" > 106-line1.txt
echo "0" > 106-line2.txt
echo "No" > 106-line3.txt
echo "Yes" > 106-line4.txt
echo "1" > 106-line5.txt

# Make Python files executable
chmod +x 100-magic_string.py 101-locked_class.py

# Git commands
git add .
git commit -m "Add advanced Python everything is object tasks"
git push
