#!/bin/bash

# Create each python file
cat > 1-square.py << 'EOF'
#!/usr/bin/python3
"""Square class with private size."""
class Square:
    """Square class."""
    def __init__(self, size):
        """Init square with size."""
        self.__size = size
EOF

cat > 2-square.py << 'EOF'
#!/usr/bin/python3
"""Square class with validation."""
class Square:
    """Square class."""
    def __init__(self, size=0):
        """Init square with optional size."""
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size
EOF

cat > 3-square.py << 'EOF'
#!/usr/bin/python3
"""Square class with area method."""
class Square:
    """Square class."""
    def __init__(self, size=0):
        """Init square with optional size."""
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size

    def area(self):
        """Return square area."""
        return self.__size ** 2
EOF

cat > 4-square.py << 'EOF'
#!/usr/bin/python3
"""Square class with property."""
class Square:
    """Square class."""
    def __init__(self, size=0):
        """Init square with optional size."""
        self.size = size

    @property
    def size(self):
        """Get square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set square size."""
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Return square area."""
        return self.__size ** 2
EOF

cat > 5-square.py << 'EOF'
#!/usr/bin/python3
"""Square class with printing."""
class Square:
    """Square class."""
    def __init__(self, size=0):
        """Init square with optional size."""
        self.size = size

    @property
    def size(self):
        """Get square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set square size."""
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Return square area."""
        return self.__size ** 2

    def my_print(self):
        """Print square using #."""
        if self.__size == 0:
            print()
        else:
            for _ in range(self.__size):
                print("#" * self.__size)
EOF

cat > 6-square.py << 'EOF'
#!/usr/bin/python3
"""Square class with position."""
class Square:
    """Square class."""
    def __init__(self, size=0, position=(0, 0)):
        """Init square with size and position."""
        self.size = size
        self.position = position

    @property
    def size(self):
        """Get size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set size."""
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Get position."""
        return self.__position

    @position.setter
    def position(self, value):
        """Set position."""
        if not isinstance(value, tuple) or len(value) != 2 or \
           not all(isinstance(n, int) and n >= 0 for n in value):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Return area."""
        return self.__size ** 2

    def my_print(self):
        """Print square with position."""
        if self.__size == 0:
            print()
            return
        for _ in range(self.__position[1]):
            print()
        for _ in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)
EOF

# Make all files executable
chmod +x {1..6}-square.py

# Add and commit files
git add {1..6}-square.py
git commit -m "Add Square class implementations"
git push
