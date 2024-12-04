#!/bin/bash

# Create directory if it doesn't exist
mkdir -p python-inheritance/tests

# 0-lookup.py
cat > python-inheritance/0-lookup.py << 'EOF'
#!/usr/bin/python3
"""Module for lookup method"""

def lookup(obj):
    """Returns list of available attributes and methods of an object"""
    return dir(obj)
EOF

# 1-my_list.py
cat > python-inheritance/1-my_list.py << 'EOF'
#!/usr/bin/python3
"""Module for MyList class"""

class MyList(list):
    """Class that inherits from list"""
    def print_sorted(self):
        """Prints the list in ascending order"""
        print(sorted(self))
EOF

# 1-my_list.txt test file
cat > python-inheritance/tests/1-my_list.txt << 'EOF'
>>> MyList = __import__('1-my_list').MyList
>>> my_list = MyList()
>>> my_list.append(1)
>>> my_list.append(4)
>>> my_list.append(2)
>>> my_list.print_sorted()
[1, 2, 4]
>>> print(my_list)
[1, 4, 2]
>>> my_list = MyList([3, 2, 1])
>>> my_list.print_sorted()
[1, 2, 3]
>>> my_list = MyList()
>>> my_list.print_sorted()
[]
>>> my_list = MyList([-3, -2, -1])
>>> my_list.print_sorted()
[-3, -2, -1]
EOF

# 2-is_same_class.py
cat > python-inheritance/2-is_same_class.py << 'EOF'
#!/usr/bin/python3
"""Module for is_same_class method"""

def is_same_class(obj, a_class):
    """Returns True if object is exactly an instance of specified class"""
    return type(obj) is a_class
EOF

# 3-is_kind_of_class.py
cat > python-inheritance/3-is_kind_of_class.py << 'EOF'
#!/usr/bin/python3
"""Module for is_kind_of_class method"""

def is_kind_of_class(obj, a_class):
    """Returns True if object is an instance of, or inherited from, specified class"""
    return isinstance(obj, a_class)
EOF

# 4-inherits_from.py
cat > python-inheritance/4-inherits_from.py << 'EOF'
#!/usr/bin/python3
"""Module for inherits_from method"""

def inherits_from(obj, a_class):
    """Returns True if object is an instance of a class that inherited from specified class"""
    return isinstance(obj, a_class) and type(obj) is not a_class
EOF

# 5-base_geometry.py
cat > python-inheritance/5-base_geometry.py << 'EOF'
#!/usr/bin/python3
"""Module for BaseGeometry class"""

class BaseGeometry:
    """Empty class"""
    pass
EOF

# 6-base_geometry.py
cat > python-inheritance/6-base_geometry.py << 'EOF'
#!/usr/bin/python3
"""Module for BaseGeometry class"""

class BaseGeometry:
    """BaseGeometry class"""
    def area(self):
        """Raises an Exception"""
        raise Exception("area() is not implemented")
EOF

# 7-base_geometry.py
cat > python-inheritance/7-base_geometry.py << 'EOF'
#!/usr/bin/python3
"""Module for BaseGeometry class"""

class BaseGeometry:
    """BaseGeometry class"""
    def area(self):
        """Raises an Exception"""
        raise Exception("area() is not implemented")

    def integer_validator(self, name, value):
        """Validates value is an integer greater than 0"""
        if type(value) is not int:
            raise TypeError(f"{name} must be an integer")
        if value <= 0:
            raise ValueError(f"{name} must be greater than 0")
EOF

# 7-base_geometry.txt test file
cat > python-inheritance/tests/7-base_geometry.txt << 'EOF'
>>> BaseGeometry = __import__('7-base_geometry').BaseGeometry
>>> bg = BaseGeometry()
>>> bg.integer_validator("my_int", 12)
>>> bg.integer_validator("width", 89)
>>> try:
...     bg.integer_validator("name", "John")
... except Exception as e:
...     print("[{}] {}".format(e.__class__.__name__, e))
[TypeError] name must be an integer
>>> try:
...     bg.integer_validator("age", 0)
... except Exception as e:
...     print("[{}] {}".format(e.__class__.__name__, e))
[ValueError] age must be greater than 0
>>> try:
...     bg.integer_validator("distance", -4)
... except Exception as e:
...     print("[{}] {}".format(e.__class__.__name__, e))
[ValueError] distance must be greater than 0
EOF

# 8-rectangle.py
cat > python-inheritance/8-rectangle.py << 'EOF'
#!/usr/bin/python3
"""Module for Rectangle class"""
BaseGeometry = __import__('7-base_geometry').BaseGeometry

class Rectangle(BaseGeometry):
    """Rectangle class that inherits from BaseGeometry"""
    def __init__(self, width, height):
        """Initialize rectangle with width and height"""
        self.integer_validator("width", width)
        self.integer_validator("height", height)
        self.__width = width
        self.__height = height
EOF

# 9-rectangle.py
cat > python-inheritance/9-rectangle.py << 'EOF'
#!/usr/bin/python3
"""Module for Rectangle class"""
BaseGeometry = __import__('7-base_geometry').BaseGeometry

class Rectangle(BaseGeometry):
    """Rectangle class that inherits from BaseGeometry"""
    def __init__(self, width, height):
        """Initialize rectangle with width and height"""
        self.integer_validator("width", width)
        self.integer_validator("height", height)
        self.__width = width
        self.__height = height

    def area(self):
        """Return area of rectangle"""
        return self.__width * self.__height

    def __str__(self):
        """Return string representation of rectangle"""
        return f"[Rectangle] {self.__width}/{self.__height}"
EOF

# 10-square.py
cat > python-inheritance/10-square.py << 'EOF'
#!/usr/bin/python3
"""Module for Square class"""
Rectangle = __import__('9-rectangle').Rectangle

class Square(Rectangle):
    """Square class that inherits from Rectangle"""
    def __init__(self, size):
        """Initialize square with size"""
        self.integer_validator("size", size)
        super().__init__(size, size)
        self.__size = size
EOF

# 11-square.py
cat > python-inheritance/11-square.py << 'EOF'
#!/usr/bin/python3
"""Module for Square class"""
Rectangle = __import__('9-rectangle').Rectangle

class Square(Rectangle):
    """Square class that inherits from Rectangle"""
    def __init__(self, size):
        """Initialize square with size"""
        self.integer_validator("size", size)
        super().__init__(size, size)
        self.__size = size

    def __str__(self):
        """Return string representation of square"""
        return f"[Square] {self._Rectangle__width}/{self._Rectangle__height}"
EOF

# Make all Python files executable
chmod +x python-inheritance/*.py

# Initialize git and push
cd python-inheritance
git add .
git commit -m "Complete Python inheritance tasks"
git push

echo "All files have been created and pushed to the repository"
