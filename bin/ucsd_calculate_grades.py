#!/usr/bin/python3

import getopt, sys, os.path
import csv
import re
import numpy

def usage():
    scriptname = os.path.basename(sys.argv[0])
    print("usage: " + scriptname + ' <input.csv>')

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

    if len(args) != 1:
        usage()
        sys.exit(2)

    filename = args[0]
    return filename
    

def main():
    filename = getopts()
    with open(filename, newline='') as csvfile:
        studentreader = csv.DictReader(csvfile, delimiter=',', quotechar='"', skipinitialspace=True)
        
        # Get keys from first record
        s = next(studentreader)
        keys = s.keys()
        # Return reader to first record (second line in file)
        csvfile.seek(0)
        next(studentreader)

        # Assessment items
        assessmentitems = []
        assessments = [{"title": "Homework", "pattern": r'HW', "function": lambda x: (sum(x) - min(x))/(len(x)-1), "weight": 15}, {"title": "Matlab", "pattern": r'MATLAB', "function": lambda x: (sum(x) - min(x))/(len(x)-1), "weight": 10}, {"title": "Midterm", "pattern": r'Midterm', "function": lambda x: numpy.mean(x), "weight": 40}, {"title": "Final", "pattern": r'Final', "function": lambda x: sum(x), "weight": 35}]
        pointspattern = r'\[Total Pts: ([^]]+)]'

        for assessment in assessments:
            loopkeys = [k for k in keys if re.match(assessment["pattern"], k)]
            assessmentitems.append({"title": assessment["title"], "keys": loopkeys, "function": assessment["function"], "weight": assessment["weight"]})

        for student in studentreader:
            scores = []
            for assessmentitem in assessmentitems:
                func = assessmentitem["function"]
                itemscores = [float(student[k]) for k in assessmentitem["keys"]]
                itempoints = numpy.array([float(re.search(pointspattern, k).group(1)) for k in assessmentitem["keys"]])
                itempercentages = numpy.divide(itemscores, itempoints)
                total = func(itempercentages)
                weightedtotal = assessmentitem["weight"] * total

                scores.append({"title": assessmentitem["title"], "scores": itemscores, "points": itempoints, "percentages": itempercentages, "total": total, "weightedtotal": weightedtotal})
                

            weightedscore = sum(score["weightedtotal"] for score in scores)


 # with open('eggs.csv', 'w', newline='') as csvfile:
 #    spamwriter = csv.writer(csvfile, delimiter=' ',
 #                            quotechar='|', quoting=csv.QUOTE_MINIMAL)
 #    spamwriter.writerow(['Spam'] * 5 + ['Baked Beans'])
 #    spamwriter.writerow(['Spam', 'Lovely Spam', 'Wonderful Spam'])


if __name__ == "__main__":
    main()

