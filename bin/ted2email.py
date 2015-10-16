#!/usr/bin/python3

import sys
import csv

tabin = csv.reader(sys.stdin, dialect=csv.excel)

for row in tabin:
    print(row[-1] + "@ucsd.edu")


