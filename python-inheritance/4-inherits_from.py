#!/usr/bin/python3
"""Module for inherits_from method."""


def inherits_from(obj, a_class):
    """Returns True if obj is instance of class that inherited from a_class.

    Args:
        obj: The object to check
        a_class: The class to match the type of obj to
    """
    return isinstance(obj, a_class) and type(obj) is not a_class
