#!/usr/bin/python3
if __name__ == "__main__":
    import sys

    total = 0
    for arg in sys.argv[1:]:
        try:
            total += int(arg)
        except ValueError:
            pass  # Ignore non-integer arguments

    print("{}".format(total))
