#!/bin/python
import re


# PART ONE

# input.txt as file
file = open('input.txt', 'r')


# combines first and last digits of a string
def first_last_pt1(i):
    match = re.findall(r'\d', i)
    first = match[0]
    last = match[-1]
    string = str(first + last)
    return int(string)


# set num to 0
num = 0

for line in file:
    num = first_last_pt1(line) + int(num)

print('part one answer:', num)


# PART TWO
# I want to die

def reverse(string):
    string = string[::-1]
    return string


def first_last_pt2(i):
    first = re.search(r'\d|one|two|three|four|five|six|seven|eight|nine', i)[0]
    if first.isalpha():
        for word in first:
            # should be able to file in the first and second paramaters
            # from a list in a for loop instead of manually doing this but it
            first = first.replace("one", "1")
            first = first.replace("two", "2")
            first = first.replace("three", "3")
            first = first.replace("four", "4")
            first = first.replace("five", "5")
            first = first.replace("six", "6")
            first = first.replace("seven", "7")
            first = first.replace("eight", "8")
            first = first.replace("nine", "9")
    i = reverse(i)
    last = re.search(r'\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin', i)[0]
    if last.isalpha():
        for word in last:
            # solution above would also work here, except use the reverse
            # function for each in the list
            last = last.replace("eno", "1")
            last = last.replace("owt", "2")
            last = last.replace("eerht", "3")
            last = last.replace("ruof", "4")
            last = last.replace("evif", "5")
            last = last.replace("xis", "6")
            last = last.replace("neves", "7")
            last = last.replace("thgie", "8")
            last = last.replace("enin", "9")
    string = str(first + last)
    return int(string)


# open file reset cursor to top
file.seek(0)

# reset num to zero for second part
num = 0

for line in file:
    num = first_last_pt2(line) + int(num)

print('part two asnwer:', num)
