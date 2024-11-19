#!/usr/bin/python3
"""A module for a Square class."""


class Square:
    """A class that defines a square."""

    def __init__(self, size=0):
        """Initialize a Square.

        Args:
            size (int, optional): The size of the square. Defaults to 0.

        Raises:
            TypeError: If size is not an integer.
            ValueError: If size is less than 0.
        """
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size

    def area(self):
        """Calculate area of the square.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2
