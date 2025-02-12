#!/bin/bash

# Function to create file and add content
create_file() {
    filename=$1
    content=$2
    echo "$content" > "$filename"
    echo "Created $filename"
}

# Create files and add content
create_file "0-print_list_integer.py" "def print_list_integer(my_list=[]):
    for num in my_list:
        print(\"{:d}\".format(num))"

create_file "1-element_at.py" "def element_at(my_list, idx):
    if idx < 0 or idx >= len(my_list):
        return None
    return my_list[idx]"

create_file "2-replace_in_list.py" "def replace_in_list(my_list, idx, element):
    if idx < 0 or idx >= len(my_list):
        return my_list
    my_list[idx] = element
    return my_list"

create_file "3-print_reversed_list_integer.py" "def print_reversed_list_integer(my_list=[]):
    if my_list:
        for num in reversed(my_list):
            print(\"{:d}\".format(num))"

create_file "4-new_in_list.py" "def new_in_list(my_list, idx, element):
    if idx < 0 or idx >= len(my_list):
        return my_list.copy()
    new_list = my_list.copy()
    new_list[idx] = element
    return new_list"

# Make files executable
chmod +x 0-print_list_integer.py 1-element_at.py 2-replace_in_list.py 3-print_reversed_list_integer.py 4-new_in_list.py

# Git operations
git add 0-print_list_integer.py 1-element_at.py 2-replace_in_list.py 3-print_reversed_list_integer.py 4-new_in_list.py
git commit -m "Add solutions for tasks 0-4"
git push 
