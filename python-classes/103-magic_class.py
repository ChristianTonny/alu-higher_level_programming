#!/usr/bin/python3
"""A module that defines a class matching given Python bytecode."""


import math


class MagicClass:
    """A class that performs calculations on a circle."""

    def __init__(self, radius=0):
        """Initialize MagicClass.

        Args:
            radius (int or float, optional): The radius. Defaults to 0.

        Raises:
            TypeError: If radius is not a number.
        """
        self.__radius = 0
        if type(radius) is not int and type(radius) is not float:
            raise TypeError('radius must be a number')
        self.__radius = radius

    def area(self):
        """Calculate the area of the circle.

        Returns:
            float: The area of the circle.
        """
        return self.__radius ** 2 * math.pi

    def circumference(self):
        """Calculate the circumference of the circle.

        Returns:
            float: The circumference of the circle.
        """
        return 2 * math.pi * self.__radius
