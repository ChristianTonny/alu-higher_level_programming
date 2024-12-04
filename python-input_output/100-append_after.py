#!/usr/bin/python3
"""Module for inserting text after specific strings in a file."""


def append_after(filename="", search_string="", new_string=""):
    """Insert text after each line containing a specific string.

    Args:
        filename (str): Name of the file to process
        search_string (str): String to search for in each line
        new_string (str): String to insert after matching lines
    """
    text = ""
    with open(filename, 'r', encoding='utf-8') as f:
        for line in f:
            text += line
            if search_string in line:
                text += new_string

    with open(filename, 'w', encoding='utf-8') as f:
        f.write(text)
