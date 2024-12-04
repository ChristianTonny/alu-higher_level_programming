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
