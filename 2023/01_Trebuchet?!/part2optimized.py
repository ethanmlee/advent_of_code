#!/bin/python
import re
import sys

input_file = sys.argv[1]

file = open(input_file, 'r')
d = {
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
}


def word2digit(string):
    if string.isalpha():
        return d[string]
    else:
        return string


def first_last(line):
    # I still think the pattern could be created from the dictionary
    pattern = r'\d|one|two|three|four|five|six|seven|eight|nine'
    first = re.search(pattern, line)[0]
    first = word2digit(first)
    # if the pattern can be created from the dictionary I could just reverse
    # each in the list
    pattern = r'\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin'
    last = re.search(pattern, (line)[::-1])[0]
    last = word2digit((last)[::-1])

    return int(str(first + last))


num = 0
for line in file:
    num = first_last(line) + num

print('part two asnwer:', num)
