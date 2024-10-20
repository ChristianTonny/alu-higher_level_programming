#!/usr/bin/python3
print("".join([chr((i - 97 + 13) % 26 + 97 + (32 if i % 2 else 0)) for i in range(122, 96, -1)]), end="")
