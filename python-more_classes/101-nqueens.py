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
