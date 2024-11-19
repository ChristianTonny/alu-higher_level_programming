#!/bin/bash
for script in $(ls [0-9]* | sort -n); do
    echo "=== $script ==="
    cat "$script"
    echo ""
done > script_contents.txt
