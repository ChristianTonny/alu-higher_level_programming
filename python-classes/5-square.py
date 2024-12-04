#!/usr/bin/python3
"""A module for a Square class."""


class Square:
    """A class that defines a square."""

    def __init__(self, size=0):
        """Initialize a Square.

        Args:
            size (int, optional): The size of the square. Defaults to 0.
        """
        self.size = size

    @property
    def size(self):
        """Get or set the size of the square.

        Returns:
            int: The size of the square.

        Raises:
            TypeError: If size is not an integer.
            ValueError: If size is less than 0.
        """
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Calculate area of the square.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2

    def my_print(self):
        """Print the square using # character."""
        if self.__size == 0:
            print()
        else:
            for i in range(self.__size):
                print("#" * self.__size)
