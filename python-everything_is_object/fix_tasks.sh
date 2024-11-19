#!/bin/bash

# Update 100-magic_string.py
echo 'def magic_string():
    magic_string.counter = getattr(magic_string, "counter", 0) + 1
    return ", ".join(["BestSchool"] * magic_string.counter)
' > 100-magic_string.py

# Update 101-locked_class.py
echo 'class LockedClass:
    """A class that only allows creating first_name attribute."""
    __slots__ = ["first_name"]
' > 101-locked_class.py

# Update Task 32 files
echo "0" > 103-line1.txt
echo "0" > 103-line2.txt

# Update Task 33 files
echo "1" > 104-line1.txt
echo "1" > 104-line2.txt
echo "Yes" > 104-line3.txt
echo "Yes" > 104-line4.txt
echo "1" > 104-line5.txt

# Git commands
git add .
git commit -m "Fix Python everything is object tasks"
git push
