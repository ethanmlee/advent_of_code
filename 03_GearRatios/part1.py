#!/bin/python
import re

# FILTERED ON DAY 3 PART 1 :(

# I was trying to draw a coordinate box around each number. I think it would
# have been easier if I used an array or something.

# some other ideas on how to do it in no particular order:
# - use a fucking array or grid but I am a bad programmer and don't know that
#   and wanted to avoid it if I could
# - look for symbols instead of numbers
# - git gud

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
        # I was trying to make a dictionary with the information needed for
        # another for loop here but the numbers kept getting overwritten
        # if a line had the same number twice.

        # howmany = line.count(each)
        # if howmany > 1:
        #     print(howmany)
        #     print(each)
        #
        # each = str(linenum) + " " + str(each)
        # numbounds = {each: bounds}
        # dictionary.update(numbounds)
