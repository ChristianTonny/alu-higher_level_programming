#!/usr/bin/python3
"""Module for is_kind_of_class method."""


def is_kind_of_class(obj, a_class):
    """Returns True if object is an instance of, or inherited from, a class.

    Args:
        obj: The object to check
        a_class: The class to match the type of obj to
    """
    return isinstance(obj, a_class)
