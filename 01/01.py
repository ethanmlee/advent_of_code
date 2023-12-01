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

def first_last_pt2(i):
    match = re.findall(r'\d|one|two|three|four|five|six|seven|eight|nine', i)
    for i in range(len(match)):
        if match[i] == 'one':
            match[i] = '1'
        if match[i] == 'two':
            match[i] = '2'
        if match[i] == 'three':
            match[i] = '3'
        if match[i] == 'four':
            match[i] = '4'
        if match[i] == 'five':
            match[i] = '5'
        if match[i] == 'six':
            match[i] = '6'
        if match[i] == 'seven':
            match[i] = '7'
        if match[i] == 'eight':
            match[i] = '8'
        if match[i] == 'nine':
            match[i] = '9'
    print(match)
    first = match[0]
    last = match[-1]
    string = str(first + last)
    return int(string)


# open file reset cursor to top
file.seek(0)

# reset num to zero for second part
num = 0

for line in file:
    num = first_last_pt2(line) + int(num)

print('part two asnwer:', num)
