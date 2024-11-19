#!/usr/bin/python3
"""Script that reads stdin line by line and computes metrics."""
import sys


def print_stats(total_size, status_codes):
    """Print accumulated metrics.

    Args:
        total_size (int): Total accumulated file size
        status_codes (dict): Count of status codes
    """
    print('File size: {}'.format(total_size))
    for code in sorted(status_codes.keys()):
        if status_codes[code] != 0:
            print('{}: {}'.format(code, status_codes[code]))


def main():
    """Process stdin line by line and compute metrics."""
    total_size = 0
    count = 0
    status_codes = {
        '200': 0, '301': 0, '400': 0, '401': 0,
        '403': 0, '404': 0, '405': 0, '500': 0
    }

    try:
        for line in sys.stdin:
            count += 1
            try:
                parts = line.split()
                if len(parts) < 7:
                    continue
                # Get the last part as file size
                total_size += int(parts[-1])
                # Get the status code (second to last part)
                status = parts[-2]
                if status in status_codes:
                    status_codes[status] += 1
            except (IndexError, ValueError):
                pass

            if count % 10 == 0:
                print_stats(total_size, status_codes)

        print_stats(total_size, status_codes)

    except KeyboardInterrupt:
        print_stats(total_size, status_codes)
        raise


if __name__ == '__main__':
    main()
