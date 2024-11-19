# First, let's create a file called create_solutions.sh:

#!/bin/bash

# 0-square_matrix_simple.py
cat > 0-square_matrix_simple.py << 'EOL'
#!/usr/bin/python3
def square_matrix_simple(matrix=[]):
    return [[x**2 for x in row] for row in matrix]
EOL

# 1-search_replace.py
cat > 1-search_replace.py << 'EOL'
#!/usr/bin/python3
def search_replace(my_list, search, replace):
    return [replace if x == search else x for x in my_list]
EOL

# 2-uniq_add.py
cat > 2-uniq_add.py << 'EOL'
#!/usr/bin/python3
def uniq_add(my_list=[]):
    return sum(set(my_list))
EOL

# 3-common_elements.py
cat > 3-common_elements.py << 'EOL'
#!/usr/bin/python3
def common_elements(set_1, set_2):
    return set_1 & set_2
EOL

# 4-only_diff_elements.py
cat > 4-only_diff_elements.py << 'EOL'
#!/usr/bin/python3
def only_diff_elements(set_1, set_2):
    return set_1 ^ set_2
EOL

# 5-number_keys.py
cat > 5-number_keys.py << 'EOL'
#!/usr/bin/python3
def number_keys(a_dictionary):
    return len(a_dictionary)
EOL

# 6-print_sorted_dictionary.py
cat > 6-print_sorted_dictionary.py << 'EOL'
#!/usr/bin/python3
def print_sorted_dictionary(a_dictionary):
    for key in sorted(a_dictionary.keys()):
        print("{}: {}".format(key, a_dictionary[key]))
EOL

# 7-update_dictionary.py
cat > 7-update_dictionary.py << 'EOL'
#!/usr/bin/python3
def update_dictionary(a_dictionary, key, value):
    a_dictionary[key] = value
    return a_dictionary
EOL

# 8-simple_delete.py
cat > 8-simple_delete.py << 'EOL'
#!/usr/bin/python3
def simple_delete(a_dictionary, key=""):
    if key in a_dictionary:
        del a_dictionary[key]
    return a_dictionary
EOL

# 9-multiply_by_2.py
cat > 9-multiply_by_2.py << 'EOL'
#!/usr/bin/python3
def multiply_by_2(a_dictionary):
    return {key: value * 2 for key, value in a_dictionary.items()}
EOL

# 10-best_score.py
cat > 10-best_score.py << 'EOL'
#!/usr/bin/python3
def best_score(a_dictionary):
    if not a_dictionary:
        return None
    return max(a_dictionary, key=a_dictionary.get)
EOL

# 11-multiply_list_map.py
cat > 11-multiply_list_map.py << 'EOL'
#!/usr/bin/python3
def multiply_list_map(my_list=[], number=0):
    return list(map(lambda x: x * number, my_list))
EOL

# 12-roman_to_int.py
cat > 12-roman_to_int.py << 'EOL'
#!/usr/bin/python3
def roman_to_int(roman_string):
    if not isinstance(roman_string, str) or roman_string is None:
        return 0
    
    roman_values = {
        'I': 1, 'V': 5, 'X': 10, 'L': 50,
        'C': 100, 'D': 500, 'M': 1000
    }
    
    total = 0
    prev_value = 0
    
    for char in reversed(roman_string):
        curr_value = roman_values[char]
        if curr_value >= prev_value:
            total += curr_value
        else:
            total -= curr_value
        prev_value = curr_value
    
    return total
EOL

# Make all files executable
chmod +x *.py

# Git operations
git add *.py
git commit -m "Add Python data structures solutions"
git push 

echo "All files have been created, made executable, and pushed to git!"
EOL
