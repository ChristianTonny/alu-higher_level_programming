#!/usr/bin/python3
"""
a script that lists all states with a name starting with N
"""
import MySQLdb
import sys


if __name__ == '__main__':
    con = MySQLdb.connect(db=sys.argv[3], user=sys.argv[1], passwd=sys.argv[2])
    with con.cursor() as cur:
        """Used context manager to automatically close the cursor object"""
        cur.execute('SELECT * FROM states ORDER BY states.id;')
        [print(row) for row in cur.fetchall() if row[1][0] == "N"]
    con.close()
