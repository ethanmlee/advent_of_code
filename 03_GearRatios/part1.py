#!/bin/python
import re


file = open('input.txt', 'r')

period = "."
linenum = 0
linelist = []

# dictionary = {}

for line in file:
    linelist.append(line)
    linelist = [x.strip() for x in linelist]

    linenum = linenum + 1
    print("line number is: " + str(linenum))
    numbers = re.findall(r'\d+', line)

    for each in numbers:

        # get numbers bounds
        oneleft = line.index(each) - 1
        oneright = line.index(each) + len(each)
        bounds = [oneleft, oneright]

        print()

        # FUCK LINES HAVE REPEATING NUMBERS
        # howmany = line.count(each)
        # if howmany > 1:
        #     print(howmany)
        #     print(each)
        #
        # each = str(linenum) + " " + str(each)
        # numbounds = {each: bounds}
        # dictionary.update(numbounds)
