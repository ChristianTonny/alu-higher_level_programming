#!/usr/bin/python3
"""Module for saving JSON to file."""
import json


def save_to_json_file(my_obj, filename):
    """Write an Object to a text file using JSON representation."""
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(my_obj, f)
