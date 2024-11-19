#!/usr/bin/python3
"""Module that defines the LockedClass.

This module contains a class that prevents the user from dynamically
creating new instance attributes, except if the new instance
attribute is called first_name.
"""


class LockedClass:
    """A class that only allows the creation of first_name attribute.

    This class uses __slots__ to restrict the creation of attributes
    to only first_name.

    Attributes:
        first_name: The only allowed instance attribute
    """
    __slots__ = ["first_name"]
