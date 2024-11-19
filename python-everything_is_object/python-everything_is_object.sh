#!/bin/bash

# Fix 100-magic_string.py - it needs to return "Holberton" instead of "BestSchool"
echo '#!/usr/bin/python3
def magic_string():
    magic_string.counter = getattr(magic_string, "counter", 0) + 1
    return ", ".join(["Holberton"] * magic_string.counter)' > 100-magic_string.py

# Fix 101-locked_class.py - remove documentation and ensure only first_name attribute is allowed
echo '#!/usr/bin/python3
class LockedClass:
    __slots__ = ["first_name"]' > 101-locked_class.py

# Make Python files executable
chmod +x 100-magic_string.py 101-locked_class.py

# Git commands
git add 100-magic_string.py 101-locked_class.py
git commit -m "Fix Python files output and remove documentation"
git push
