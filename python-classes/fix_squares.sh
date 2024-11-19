#!/bin/bash

# 3-square.py
cat > 3-square.py << 'EOF'
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
EOF

# 4-square.py
cat > 4-square.py << 'EOF'
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
EOF

# 5-square.py
cat > 5-square.py << 'EOF'
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
EOF

# 6-square.py
cat > 6-square.py << 'EOF'
#!/usr/bin/python3
"""A module for a Square class."""


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
        if self.__size == 0:
            print()
            return

        for i in range(self.__position[1]):
            print()
        for i in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)
EOF

# 100-singly_linked_list.py
cat > 100-singly_linked_list.py << 'EOF'
#!/usr/bin/python3
"""A module for singly linked list implementation.

This module defines Node and SinglyLinkedList classes.
"""


class Node:
    """A class representing a node in a singly linked list."""

    def __init__(self, data, next_node=None):
        """Initialize a Node.

        Args:
            data (int): The data stored in the node.
            next_node (Node, optional): The next node. Defaults to None.
        """
        self.data = data
        self.next_node = next_node

    @property
    def data(self):
        """Get or set the data of the node.

        Returns:
            int: The data stored in the node.
        """
        return self.__data

    @data.setter
    def data(self, value):
        if not isinstance(value, int):
            raise TypeError("data must be an integer")
        self.__data = value

    @property
    def next_node(self):
        """Get or set the next node.

        Returns:
            Node: The next node.
        """
        return self.__next_node

    @next_node.setter
    def next_node(self, value):
        if value is not None and not isinstance(value, Node):
            raise TypeError("next_node must be a Node object")
        self.__next_node = value


class SinglyLinkedList:
    """A class representing a singly linked list."""

    def __init__(self):
        """Initialize an empty singly linked list."""
        self.__head = None

    def sorted_insert(self, value):
        """Insert a node in sorted order.

        Args:
            value (int): The value to insert.
        """
        new = Node(value)
        if not self.__head or value < self.__head.data:
            new.next_node = self.__head
            self.__head = new
            return

        current = self.__head
        while current.next_node and current.next_node.data < value:
            current = current.next_node
        new.next_node = current.next_node
        current.next_node = new

    def __str__(self):
        """Return string representation of the list.

        Returns:
            str: The list as a string, one node per line.
        """
        result = []
        current = self.__head
        while current:
            result.append(str(current.data))
            current = current.next_node
        return '\n'.join(result)
EOF

# Make all files executable
chmod +x {3..6}-square.py 100-singly_linked_list.py

# Add and commit changes
git add {3..6}-square.py 100-singly_linked_list.py
git commit -m "Fix all square class implementations"
git push
EOF

3. Make the script executable:
```bash
chmod +x fix_squares.sh
```

4. Run the script:
```bash
./fix_squares.sh
```

The script will:
1. Create all files with proper PEP8 spacing (two blank lines before class definitions)
2. Add proper documentation for all classes and methods
3. Make all files executable
4. Add, commit, and push the changes to GitHub

Would you like me to continue with files 101-103 as well?
