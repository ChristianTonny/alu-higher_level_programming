#!/usr/bin/python3
"""
a script that takes in an argument and displays all values
"""
import MySQLdb
import sys

if __name__ == '__main__':
    con = MySQLdb.connect(db=sys.argv[3], user=sys.argv[1], passwd=sys.argv[2])
    with con.cursor() as cur:
        """Used context manager to automatically close the cursor object"""
        query = "SELECT * FROM states WHERE name LIKE BINARY '{}' ORDER BY id;"
        cur.execute(query.format(sys.argv[4]))
        [print(row) for row in cur.fetchall()]
    con.close()
