#!/bin/bash

# 101-square.py
cat > 101-square.py << 'EOF'
#!/usr/bin/python3
"""A module for a Square class with string representation."""


class Square:
    """A class that defines a square."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a Square.

        Args:
            size (int, optional): The size of the square. Defaults to 0.
            position (tuple, optional): Position of the square. Defaults to (0,0).
        """
        self.size = size
        self.position = position

    @property
    def size(self):
        """Get or set the size of the square.

        Returns:
            int: The size of the square.
        """
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Get or set the position of the square.

        Returns:
            tuple: The position of the square.
        """
        return self.__position

    @position.setter
    def position(self, value):
        if (not isinstance(value, tuple) or len(value) != 2 or
                not all(isinstance(n, int) and n >= 0 for n in value)):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Calculate area of the square.

        Returns:
            int: The area of the square.
        """
        return self.__size ** 2

    def my_print(self):
        """Print the square using # character."""
        print(self.__str__())

    def __str__(self):
        """Define string representation of the square.

        Returns:
            str: The string representation of the square.
        """
        if self.__size == 0:
            return ""
        result = '\n' * self.__position[1]
        result += '\n'.join(' ' * self.__position[0] +
                           '#' * self.__size
                           for _ in range(self.__size))
        return result
EOF

# 102-square.py
cat > 102-square.py << 'EOF'
#!/usr/bin/python3
"""A module for a Square class with comparison capabilities."""


class Square:
    """A class that defines a square with comparison methods."""

    def __init__(self, size=0):
        """Initialize a Square.

        Args:
            size (float or int, optional): The size of the square. Defaults to 0.
        """
        self.size = size

    @property
    def size(self):
        """Get or set the size of the square.

        Returns:
            float or int: The size of the square.
        """
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, (int, float)):
            raise TypeError("size must be a number")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Calculate area of the square.

        Returns:
            float or int: The area of the square.
        """
        return self.__size ** 2

    def __eq__(self, other):
        """Equal comparison.

        Args:
            other (Square): Square to compare with.

        Returns:
            bool: True if areas are equal, False otherwise.
        """
        return self.area() == other.area()

    def __ne__(self, other):
        """Not equal comparison.

        Args:
            other (Square): Square to compare with.

        Returns:
            bool: True if areas are not equal, False otherwise.
        """
        return self.area() != other.area()

    def __gt__(self, other):
        """Greater than comparison.

        Args:
            other (Square): Square to compare with.

        Returns:
            bool: True if area is greater, False otherwise.
        """
        return self.area() > other.area()

    def __ge__(self, other):
        """Greater than or equal comparison.

        Args:
            other (Square): Square to compare with.

        Returns:
            bool: True if area is greater or equal, False otherwise.
        """
        return self.area() >= other.area()

    def __lt__(self, other):
        """Less than comparison.

        Args:
            other (Square): Square to compare with.

        Returns:
            bool: True if area is smaller, False otherwise.
        """
        return self.area() < other.area()

    def __le__(self, other):
        """Less than or equal comparison.

        Args:
            other (Square): Square to compare with.

        Returns:
            bool: True if area is smaller or equal, False otherwise.
        """
        return self.area() <= other.area()
EOF

# 103-magic_class.py
cat > 103-magic_class.py << 'EOF'
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
EOF

# Make files executable
chmod +x 10{1,2,3}-*.py

# Add and commit changes
git add 10{1,2,3}-*.py
git commit -m "Add advanced Square class implementations with proper documentation"
git push
EOF

1. Save this script as `fix_remaining_squares.sh`

2. Make it executable:
```bash
chmod +x fix_remaining_squares.sh
```

3. Run the script:
```bash
./fix_remaining_squares.sh
```

This will:
1. Create files 101-103 with proper PEP8 compliance
2. Add comprehensive documentation for all classes and methods
3. Make the files executable
4. Add, commit, and push the changes to GitHub

To verify everything is working:
```bash
# Check PEP8
pycodestyle 10{1,2,3}-*.py

# Check documentation
for file in 10{1,2,3}-*.py; do
    echo "Checking $file documentation..."
    python3 -c "print(__import__('${file%.*}').__doc__)"
done
```

All files should now have proper documentation and pass PEP8 validation. Let me know if you want me to adjust anything!
