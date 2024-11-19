#!/bin/bash

# 100-weight_average.py
cat > 100-weight_average.py << 'EOL'
#!/usr/bin/python3
def weight_average(my_list=[]):
    if not my_list:
        return 0

    weighted_sum = sum(score * weight for score, weight in my_list)
    total_weight = sum(weight for _, weight in my_list)

    return weighted_sum / total_weight if total_weight else 0
EOL

# 101-square_matrix_map.py
cat > 101-square_matrix_map.py << 'EOL'
#!/usr/bin/python3
def square_matrix_map(matrix=[]):
    return list(map(lambda row: list(map(lambda x: x**2, row)), matrix))
EOL

# 102-complex_delete.py
cat > 102-complex_delete.py << 'EOL'
#!/usr/bin/python3
def complex_delete(a_dictionary, value):
    keys_to_del = [key for key, val in a_dictionary.items() if val == value]
    for key in keys_to_del:
        del a_dictionary[key]
    return a_dictionary
EOL

# Make all files executable
chmod +x 100-weight_average.py
chmod +x 101-square_matrix_map.py
chmod +x 102-complex_delete.py

# Git operations
git add .
git commit -m "Add advanced Python data structures solutions"
git push 

echo "All advanced task files have been created, made executable, and pushed to git!"

