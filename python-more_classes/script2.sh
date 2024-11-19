#!/bin/bash

# Create 9-rectangle.py with proper PEP8 formatting
cat > 9-rectangle.py << 'EOL'
#!/usr/bin/python3
"""
This module defines a Rectangle class
"""


class Rectangle:
    """A rectangle class with width and height attributes"""

    number_of_instances = 0
    print_symbol = "#"

    def __init__(self, width=0, height=0):
        """Initialize a new Rectangle instance"""
        self.width = width
        self.height = height
        Rectangle.number_of_instances += 1

    @property
    def width(self):
        """Get the width of the Rectangle"""
        return self.__width

    @width.setter
    def width(self, value):
        """Set the width of the Rectangle"""
        if not isinstance(value, int):
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Get the height of the Rectangle"""
        return self.__height

    @height.setter
    def height(self, value):
        """Set the height of the Rectangle"""
        if not isinstance(value, int):
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Calculate the area of the Rectangle"""
        return self.__width * self.__height

    def perimeter(self):
        """Calculate the perimeter of the Rectangle"""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    @staticmethod
    def bigger_or_equal(rect_1, rect_2):
        """Return the Rectangle with the greater area"""
        if not isinstance(rect_1, Rectangle):
            raise TypeError("rect_1 must be an instance of Rectangle")
        if not isinstance(rect_2, Rectangle):
            raise TypeError("rect_2 must be an instance of Rectangle")
        if rect_1.area() >= rect_2.area():
            return rect_1
        return rect_2

    @classmethod
    def square(cls, size=0):
        """Create a new Rectangle instance with width == height == size"""
        return cls(size, size)

    def __str__(self):
        """Return the printable representation of the Rectangle"""
        if self.__width == 0 or self.__height == 0:
            return ""
        symbol = str(self.print_symbol)
        return "\n".join([symbol * self.__width for _ in range(self.__height)])

    def __repr__(self):
        """Return the string representation of the Rectangle"""
        return "Rectangle({:d}, {:d})".format(self.__width, self.__height)

    def __del__(self):
        """Print a message when an instance of Rectangle is deleted"""
        print("Bye rectangle...")
        Rectangle.number_of_instances -= 1
EOL

# Create 101-nqueens.py
cat > 101-nqueens.py << 'EOL'
#!/usr/bin/python3
"""
N queens solution finder module
This module solves the N queens puzzle: placing N non-attacking queens on
an N×N chessboard
"""
import sys


def init_board(n):
    """Initialize an empty N×N chessboard"""
    board = []
    for _ in range(n):
        row = [' ' for _ in range(n)]
        board.append(row)
    return board


def is_safe(board, row, col, n):
    """Check if it's safe to place a queen at board[row][col]"""
    # Check row on left side
    for j in range(col):
        if board[row][j] == 'Q':
            return False

    # Check upper diagonal on left side
    for i, j in zip(range(row, -1, -1), range(col, -1, -1)):
        if board[i][j] == 'Q':
            return False

    # Check lower diagonal on left side
    for i, j in zip(range(row, n, 1), range(col, -1, -1)):
        if board[i][j] == 'Q':
            return False

    return True


def solve_nqueens(board, col, n, solutions):
    """Recursively solve N queens puzzle"""
    if col >= n:
        solution = []
        for i in range(n):
            for j in range(n):
                if board[i][j] == 'Q':
                    solution.append([i, j])
        solutions.append(solution)
        return

    for i in range(n):
        if is_safe(board, i, col, n):
            board[i][col] = 'Q'
            solve_nqueens(board, col + 1, n, solutions)
            board[i][col] = ' '


def print_solutions(n):
    """Print all solutions to the N queens puzzle"""
    if not isinstance(n, int):
        print("N must be a number")
        sys.exit(1)
    if n < 4:
        print("N must be at least 4")
        sys.exit(1)

    board = init_board(n)
    solutions = []
    solve_nqueens(board, 0, n, solutions)

    for solution in solutions:
        print(solution)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: nqueens N")
        sys.exit(1)

    try:
        n = int(sys.argv[1])
        print_solutions(n)
    except ValueError:
        print("N must be a number")
        sys.exit(1)
EOL

# Make files executable
chmod +x 9-rectangle.py
chmod +x 101-nqueens.py

# Add and commit files
git add 9-rectangle.py 101-nqueens.py
git commit -m "Updated Rectangle class with PEP8 compliance and added N queens solution"
git push
