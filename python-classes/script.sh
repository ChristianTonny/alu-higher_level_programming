#!/bin/bash

# Create directory if it doesn't exist
mkdir -p python-classes

# Change to the directory
cd python-classes

# Create 0-square.py
cat > 0-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Empty class that defines a square"""
    pass
EOL

# Create 1-square.py
cat > 1-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with size"""
    def __init__(self, size):
        self.__size = size
EOL

# Create 2-square.py
cat > 2-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with size validation"""
    def __init__(self, size=0):
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size
EOL

# Create 3-square.py
cat > 3-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with area method"""
    def __init__(self, size=0):
        if not isinstance(size, int):
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size

    def area(self):
        return self.__size ** 2
EOL

# Create 4-square.py
cat > 4-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with getters and setters"""
    def __init__(self, size=0):
        self.size = size

    @property
    def size(self):
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        return self.__size ** 2
EOL

# Create 5-square.py
cat > 5-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with printing capability"""
    def __init__(self, size=0):
        self.size = size

    @property
    def size(self):
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, int):
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        return self.__size ** 2

    def my_print(self):
        if self.__size == 0:
            print()
        else:
            for i in range(self.__size):
                print("#" * self.__size)
EOL

# Create 6-square.py
cat > 6-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with position"""
    def __init__(self, size=0, position=(0, 0)):
        self.size = size
        self.position = position

    @property
    def size(self):
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
        return self.__position

    @position.setter
    def position(self, value):
        if not isinstance(value, tuple) or len(value) != 2 or \
           not all(isinstance(x, int) and x >= 0 for x in value):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        return self.__size ** 2

    def my_print(self):
        if self.__size == 0:
            print()
            return
        for i in range(self.__position[1]):
            print()
        for i in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)
EOL

# Create 100-singly_linked_list.py
cat > 100-singly_linked_list.py << 'EOL'
#!/usr/bin/python3
class Node:
    """Class that defines a node of a singly linked list"""
    def __init__(self, data, next_node=None):
        self.data = data
        self.next_node = next_node

    @property
    def data(self):
        return self.__data

    @data.setter
    def data(self, value):
        if not isinstance(value, int):
            raise TypeError("data must be an integer")
        self.__data = value

    @property
    def next_node(self):
        return self.__next_node

    @next_node.setter
    def next_node(self, value):
        if value is not None and not isinstance(value, Node):
            raise TypeError("next_node must be a Node object")
        self.__next_node = value

class SinglyLinkedList:
    """Class that defines a singly linked list"""
    def __init__(self):
        self.__head = None

    def sorted_insert(self, value):
        new = Node(value)
        if self.__head is None:
            self.__head = new
            return
        if value < self.__head.data:
            new.next_node = self.__head
            self.__head = new
            return
        current = self.__head
        while current.next_node and current.next_node.data < value:
            current = current.next_node
        new.next_node = current.next_node
        current.next_node = new

    def __str__(self):
        values = []
        current = self.__head
        while current:
            values.append(str(current.data))
            current = current.next_node
        return '\n'.join(values)
EOL

# Create 101-square.py
cat > 101-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with string representation"""
    def __init__(self, size=0, position=(0, 0)):
        self.size = size
        self.position = position

    @property
    def size(self):
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
        return self.__position

    @position.setter
    def position(self, value):
        if not isinstance(value, tuple) or len(value) != 2 or \
           not all(isinstance(x, int) and x >= 0 for x in value):
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        return self.__size ** 2

    def my_print(self):
        if self.__size == 0:
            print()
            return
        for i in range(self.__position[1]):
            print()
        for i in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)

    def __str__(self):
        if self.__size == 0:
            return ""
        result = []
        for i in range(self.__position[1]):
            result.append("")
        for i in range(self.__size):
            result.append(" " * self.__position[0] + "#" * self.__size)
        return "\n".join(result)
EOL

# Create 102-square.py
cat > 102-square.py << 'EOL'
#!/usr/bin/python3
class Square:
    """Class that defines a square with comparison operations"""
    def __init__(self, size=0):
        self.size = size

    @property
    def size(self):
        return self.__size

    @size.setter
    def size(self, value):
        if not isinstance(value, (int, float)):
            raise TypeError("size must be a number")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        return self.__size ** 2

    def __eq__(self, other):
        return self.area() == other.area()

    def __ne__(self, other):
        return self.area() != other.area()

    def __gt__(self, other):
        return self.area() > other.area()

    def __ge__(self, other):
        return self.area() >= other.area()

    def __lt__(self, other):
        return self.area() < other.area()

    def __le__(self, other):
        return self.area() <= other.area()
EOL

# Create 103-magic_class.py
cat > 103-magic_class.py << 'EOL'
#!/usr/bin/python3
import math

class MagicClass:
    """Class that defines a circle"""
    def __init__(self, radius=0):
        self.__radius = 0
        if type(radius) is not int and type(radius) is not float:
            raise TypeError('radius must be a number')
        self.__radius = radius

    def area(self):
        return self.__radius ** 2 * math.pi

    def circumference(self):
        return 2 * math.pi * self.__radius
EOL

# Make all files executable
chmod +x *.py

# Git commands
git add .
git commit -m "Add Python class tasks"
git push 

echo "All files have been created, made executable, and pushed to GitHub"
