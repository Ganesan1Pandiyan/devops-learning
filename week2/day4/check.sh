#!/bin/bash
FILE="test.txt"

if [ -f "$FILE" ]; then
    echo "$FILE இருக்கிறது ✅"
else
    echo "$FILE இல்லை ❌ , Creating ..."
    touch "$FILE"
fi
