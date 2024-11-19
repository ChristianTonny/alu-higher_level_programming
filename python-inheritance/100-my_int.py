#!/usr/bin/python3
"""Module for MyInt class."""


class MyInt(int):
    """Rebel version of an integer, inverting == and != operators."""

    def __eq__(self, other):
        """Override equals operator with not equals behavior."""
        return int(self) != other

    def __ne__(self, other):
        """Override not equals operator with equals behavior."""
        return int(self) == other
