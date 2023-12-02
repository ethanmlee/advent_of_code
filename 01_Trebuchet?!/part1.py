#!/bin/python
# could I do this without importing re?
import re

# input.txt as file
file = open('input.txt', 'r')


# combines first and last digits of a string
def first_last_pt1(i):
    # find all digits and make a list
    match = re.findall(r'\d', i)
    # return first digit
    first = match[0]
    # return last digit
    last = match[-1]
    # append numbers together as string
    string = str(first + last)
    # convert to integer
    return int(string)


# set num to 0
num = 0

# add all the numbers up
for line in file:
    num = first_last_pt1(line) + num

# return solution to part 1
print('part one answer:', num)
