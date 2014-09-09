#!/usr/bin/python3

import getopt, sys, os.path
import csv
import re
import numpy
import bisect
import math

def usage():
    scriptname = os.path.basename(sys.argv[0])
    print("usage: " + scriptname + ' <input.csv> <output.csv>')

def getopts():
    try:
        opts, args = getopt.getopt(sys.argv[1:], "ho:v", ["help", "output="])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)

    output = None
    verbose = False
    for o, a in opts:
        if o == "-v":
            verbose = True
        elif o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-o", "--output"):
            output = a
        else:
            assert False, "unhandled option"

    if len(args) != 2:
        usage()
        sys.exit(2)

    infilename = args[0]
    outfilename = args[1]
    return infilename, outfilename

def getgrade(g):
    # Grade table
    gradetable =[(70.0, 'F'), (73.0, 'C-'), (77.0, 'C'), (80.0, 'C+'), (83.0, 'B-'), (87.0, 'B'), (90.0, 'B+'), (93.0, 'A-'), (97.0, 'A'), (100.0, 'A+')]

    pos = bisect.bisect_right(gradetable, (math.ceil(g),))
    return gradetable[pos][1]

def main():
    infilename, outfilename = getopts()

    with open(infilename, newline='') as infile, open(outfilename, 'w', newline='') as outfile:
        studentreader = csv.DictReader(infile, delimiter=',', quotechar='"', skipinitialspace=True)
        outfields = ['Last Name', 'First Name', 'Student ID', 'SectionId', 'Final_Assigned_Egrade', 'Score']
        studentwriter = csv.DictWriter(outfile, outfields, delimiter=',', quotechar='"', skipinitialspace=True)
        studentwriter.writeheader()

        # Get keys from first record
        s = next(studentreader)
        keys = s.keys()
        # Return reader to first record (second line in file)
        infile.seek(0)
        next(studentreader)

        # Assessment items
        assessmentitems = []
        assessments = [{"title": "Homework", "pattern": r'HW', "function": lambda x: (sum(x) - min(x))/(len(x)-1), "weight": 15}, {"title": "Matlab", "pattern": r'MATLAB', "function": lambda x: (sum(x) - min(x))/(len(x)-1), "weight": 10}, {"title": "Midterm", "pattern": r'Midterm', "function": lambda x: numpy.mean(x), "weight": 40}, {"title": "Final", "pattern": r'Final', "function": lambda x: sum(x), "weight": 35}]
        pointspattern = r'\[Total Pts: ([^]]+)]'

        for assessment in assessments:
            loopkeys = [k for k in keys if re.match(assessment["pattern"], k)]
            assessmentitems.append({"title": assessment["title"], "keys": loopkeys, "function": assessment["function"], "weight": assessment["weight"]})

        for student in studentreader:
            studentout = {}
            studentout['Last Name'] = student['Last Name']
            studentout['First Name'] = student['First Name']
            studentout['Student ID'] = student['Student ID']
            studentout['SectionId'] = student['SectionId [Total Pts: 100] |122054']

            scores = []
            
            for assessmentitem in assessmentitems:
                func = assessmentitem["function"]
                itemscores = [float(student[k]) if student[k] else 0.0 for k in assessmentitem["keys"]]
                itempoints = numpy.array([float(re.search(pointspattern, k).group(1)) for k in assessmentitem["keys"]])
                itempercentages = numpy.divide(itemscores, itempoints)
                total = func(itempercentages)
                weightedtotal = assessmentitem["weight"] * total

                scores.append({"title": assessmentitem["title"], "scores": itemscores, "points": itempoints, "percentages": itempercentages, "total": total, "weightedtotal": weightedtotal})
                

            weightedscore = sum(score["weightedtotal"] for score in scores)
            studentout['Final_Assigned_Egrade'] = getgrade(weightedscore)
            studentout['Score'] = weightedscore

            studentwriter.writerow(studentout)
            

if __name__ == "__main__":
    main()

