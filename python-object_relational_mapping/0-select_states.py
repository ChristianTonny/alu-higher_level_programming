#!/usr/bin/python3
"""
A script that lists all states from the database hbtn_0e_0_usa
"""
import MySQLdb
import sys

if __name__ == '__main__':
    try:
        if len(sys.argv) != 4:
            print("Usage: {} <username> <password> <database>".format(sys.argv[0]))
            sys.exit(1)

        con = MySQLdb.connect(
            host="localhost",
            port=3306,
            user=sys.argv[1],
            passwd=sys.argv[2],
            db=sys.argv[3]
        )

        with con.cursor() as cur:
            cur.execute("SELECT * FROM states ORDER BY id ASC")
            rows = cur.fetchall()
            for row in rows:
                print(row)

    except MySQLdb.Error as e:
        print("MySQL Error: {}".format(e))
        sys.exit(1)
    finally:
        if 'con' in locals() and con:
            con.close()