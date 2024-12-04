#!/usr/bin/python3
"""Module for class to JSON conversion."""


def class_to_json(obj):
    """Return dictionary description for JSON serialization of object."""
    return obj.__dict__
