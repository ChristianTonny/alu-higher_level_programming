#!/usr/bin/python3
"""Module for loading JSON from file."""
import json


def load_from_json_file(filename):
    """Create an Object from a JSON file."""
    with open(filename, 'r', encoding='utf-8') as f:
        return json.load(f)
