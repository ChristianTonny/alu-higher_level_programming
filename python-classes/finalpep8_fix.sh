#!/bin/bash

# 6-square.py - Fixed for PEP8
cat > 6-square.py << 'EOF'
#!/usr/bin/python3
"""Define a class Square."""


class Square:
    """Represent a square."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a new square.

        Args:
            size (int): The size of the new square.
            position (tuple): The position of the new square.
        """
        self.size = size
        self.position = position

    @property
    def size(self):
        """Get/set the current size of the square."""
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        elif value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Get/set the current position of the square."""
        return self.__position

    @position.setter
    def position(self, value):
        if (not isinstance(value, tuple) or
                len(value) != 2 or
                not all(isinstance(x, int) for x in value) or
                not all(x >= 0 for x in value)):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Return the current area of the square."""
        return self.__size * self.__size

    def my_print(self):
        """Print the square with the # character."""
        if self.__size == 0:
            print("")
            return

        for y in range(self.__position[1]):
            print("")
        for i in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)
EOF

# 101-square.py - Fixed for PEP8
cat > 101-square.py << 'EOF'
#!/usr/bin/python3
"""Define a class Square."""


class Square:
    """Represent a square."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a new square.

        Args:
            size (int): The size of the new square.
            position (tuple): The position of the new square.
        """
        self.size = size
        self.position = position

    @property
    def size(self):
        """Get/set the current size of the square."""
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        elif value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Get/set the current position of the square."""
        return self.__position

    @position.setter
    def position(self, value):
        if (not isinstance(value, tuple) or
                len(value) != 2 or
                not all(isinstance(x, int) for x in value) or
                not all(x >= 0 for x in value)):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Return the current area of the square."""
        return self.__size * self.__size

    def my_print(self):
        """Print the square with the # character."""
        print(self.__str__())

    def __str__(self):
        """Define the print() representation of a Square."""
        if self.__size == 0:
            return ""

        square = []
        for y in range(self.__position[1]):
            square.append("")
        for i in range(self.__size):
            square.append(" " * self.__position[0] + "#" * self.__size)

        return "\n".join(square)
EOF

# Make files executable
chmod +x 6-square.py 101-square.py

# Verify PEP8
echo "Checking PEP8 for 6-square.py:"
pycodestyle 6-square.py
echo "Checking PEP8 for 101-square.py:"
pycodestyle 101-square.py

# Add and commit changes
git add 6-square.py 101-square.py
git commit -m "Fix PEP8 validation issues in square classes"
git push
EOF

To use this script:

1. Create the script:
```bash
vi final_pep8_fix.sh
```

2. Make it executable:
```bash
chmod +x final_pep8_fix.sh
```

3. Run it:
```bash
./final_pep8_fix.sh
```

Main changes made to fix PEP8 issues:
1. Simplified docstrings
2. Fixed line spacing
3. Improved variable names
4. Better line breaks for long conditions
5. Consistent indentation
6. More efficient string handling for __str__ method
7. Better organization of methods
8. Improved error handling structure
9. Optimized print statement logic

Both files should now pass all PEP8 validations while maintaining the required functionality according to the test cases shown in your screenshots.
