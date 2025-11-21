#!/usr/bin/env python3

import sys

print("Python Program START")

arguments = sys.argv[1:]

if len(arguments) < 2:
    print("Error: 2 or more arguments required.")
else:
    print(f"Total Arguments: {len(arguments)}")
    for i, arg in enumerate(arguments):
        print(f"Argument {i+1}: {arg}")

print("Python Program END")
