#!/usr/bin/python3
"""Script to automatically populate all Python ORM files with their code"""
import os

def create_file_content():
    """Returns a dictionary of filenames and their content"""
    return {
        "0-select_states.py": """#!/usr/bin/python3
\"\"\"Script that lists all states from the database hbtn_0e_0_usa\"\"\"
import MySQLdb
import sys

if __name__ == "__main__":
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = db.cursor()
    cursor.execute("SELECT * FROM states ORDER BY states.id")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    cursor.close()
    db.close()
""",
        "1-filter_states.py": """#!/usr/bin/python3
\"\"\"Script that lists all states with name starting with N\"\"\"
import MySQLdb
import sys

if __name__ == "__main__":
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = db.cursor()
    cursor.execute("SELECT * FROM states WHERE name LIKE 'N%' ORDER BY states.id")
    rows = cursor.fetchall()
    for row in rows:
        if row[1][0] == 'N':
            print(row)
    cursor.close()
    db.close()
""",
        "2-my_filter_states.py": """#!/usr/bin/python3
\"\"\"Script that displays values in states table where name matches argument\"\"\"
import MySQLdb
import sys

if __name__ == "__main__":
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = db.cursor()
    query = "SELECT * FROM states WHERE name = '{}' ORDER BY states.id".format(
        sys.argv[4])
    cursor.execute(query)
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    cursor.close()
    db.close()
""",
        "3-my_safe_filter_states.py": """#!/usr/bin/python3
\"\"\"Script that displays values in states table (safe from MySQL injection)\"\"\"
import MySQLdb
import sys

if __name__ == "__main__":
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = db.cursor()
    cursor.execute("SELECT * FROM states WHERE name = %s ORDER BY states.id",
                  (sys.argv[4],))
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    cursor.close()
    db.close()
""",
        "4-cities_by_state.py": """#!/usr/bin/python3
\"\"\"Script that lists all cities from the database\"\"\"
import MySQLdb
import sys

if __name__ == "__main__":
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = db.cursor()
    cursor.execute(\"""
        SELECT cities.id, cities.name, states.name
        FROM cities
        JOIN states ON cities.state_id = states.id
        ORDER BY cities.id
    \""")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
    cursor.close()
    db.close()
""",
        "5-filter_cities.py": """#!/usr/bin/python3
\"\"\"Script that lists all cities of a state from the database\"\"\"
import MySQLdb
import sys

if __name__ == "__main__":
    db = MySQLdb.connect(
        host="localhost",
        port=3306,
        user=sys.argv[1],
        passwd=sys.argv[2],
        db=sys.argv[3]
    )
    cursor = db.cursor()
    cursor.execute(\"""
        SELECT cities.name
        FROM cities
        JOIN states ON cities.state_id = states.id
        WHERE states.name = %s
        ORDER BY cities.id
    \""", (sys.argv[4],))
    rows = cursor.fetchall()
    print(", ".join([row[0] for row in rows]))
    cursor.close()
    db.close()
""",
        "model_state.py": """#!/usr/bin/python3
\"\"\"Contains State class and Base instance\"\"\"
from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class State(Base):
    \"\"\"Class representing states table\"\"\"
    __tablename__ = 'states'
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    name = Column(String(128), nullable=False)
""",
        "7-model_state_fetch_all.py": """#!/usr/bin/python3
\"\"\"Script that lists all State objects from the database\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    for state in session.query(State).order_by(State.id):
        print(f"{state.id}: {state.name}")
    session.close()
""",
        "8-model_state_fetch_first.py": """#!/usr/bin/python3
\"\"\"Script that prints the first State object from the database\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    state = session.query(State).order_by(State.id).first()
    if state:
        print(f"{state.id}: {state.name}")
    else:
        print("Nothing")
    session.close()
""",
        "9-model_state_filter_a.py": """#!/usr/bin/python3
\"\"\"Script that lists all State objects containing letter a\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    states = session.query(State).filter(
        State.name.like('%a%')).order_by(State.id)
    for state in states:
        print(f"{state.id}: {state.name}")
    session.close()
""",
        "10-model_state_my_get.py": """#!/usr/bin/python3
\"\"\"Script that prints State object with name passed as argument\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    state = session.query(State).filter(State.name == sys.argv[4]).first()
    if state:
        print(state.id)
    else:
        print("Not found")
    session.close()
""",
        "11-model_state_insert.py": """#!/usr/bin/python3
\"\"\"Script that adds the State object "Louisiana" to the database\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    new_state = State(name="Louisiana")
    session.add(new_state)
    session.commit()
    print(new_state.id)
    session.close()
""",
        "12-model_state_update_id_2.py": """#!/usr/bin/python3
\"\"\"Script that changes the name of a State object\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    state = session.query(State).filter(State.id == 2).first()
    if state:
        state.name = "New Mexico"
        session.commit()
    session.close()
""",
        "13-model_state_delete_a.py": """#!/usr/bin/python3
\"\"\"Script that deletes all State objects with name containing letter a\"\"\"
from model_state import Base, State
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    states = session.query(State).filter(State.name.like('%a%')).all()
    for state in states:
        session.delete(state)
    session.commit()
    session.close()
""",
        "model_city.py": """#!/usr/bin/python3
\"\"\"Contains City class\"\"\"
from model_state import Base
from sqlalchemy import Column, Integer, String, ForeignKey

class City(Base):
    \"\"\"Class representing cities table\"\"\"
    __tablename__ = 'cities'
    id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    name = Column(String(128), nullable=False)
    state_id = Column(Integer, ForeignKey('states.id'), nullable=False)
""",
        "14-model_city_fetch_by_state.py": """#!/usr/bin/python3
\"\"\"Script that prints all City objects from the database\"\"\"
from model_state import Base, State
from model_city import City
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import sys

if __name__ == "__main__":
    engine = create_engine('mysql+mysqldb://{}:{}@localhost:3306/{}'.format(
        sys.argv[1], sys.argv[2], sys.argv[3]), pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    session = Session()

    cities = session.query(State, City).filter(
        State.id == City.state_id).order_by(City.id)
    for state, city in cities:
        print(f"{state.name}: ({city.id}) {city.name}")
    session.close()
"""
    }

def create_files():
    """Create all required files with their content"""
    files_content = create_file_content()

    # Ensure we're in the correct directory
    if not os.path.exists('python-object_relational_mapping'):
        os.makedirs('python-object_relational_mapping')

    os.chdir('python-object_relational_mapping')

    # Create each file with its content
    for filename, content in files_content.items():
        with open(filename, 'w') as file:
            file.write(content)

        # Make the file executable
        os.chmod(filename, 0o755)
        print(f"Created and made executable: {filename}")

if __name__ == "__main__":
    create_files()
    print("\nAll files have been created and made executable!")
    print("You can now find them in the python-object_relational_mapping directory.")
