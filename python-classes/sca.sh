#!/bin/bash

# 1-square.py
cat > 1-square.py << 'EOF'
#!/usr/bin/python3
"""A module for a Square class."""


class Square:
    """A class that defines a square."""

    def __init__(self, size):
        """Initialize a Square.

        Args:
            size: The size of the square
        """
        self.__size = size
EOF

# 2-square.py
cat > 2-square.py << 'EOF'
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
EOF

# 3-square.py through 103-magic_class.py follow same pattern...
# Paste all the code I provided earlier for each file

# Make files executable
chmod +x {1..6}-square.py 100-singly_linked_list.py 10{1,2,3}-*.py

# Add and commit changes
git add .
git commit -m "Fix all square class implementations"
git push
