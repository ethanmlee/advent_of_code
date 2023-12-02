#!/bin/python
# could I do this without importing re?
import re

# input.txt as file
file = open('input.txt', 'r')


# function to reverse the string
def reverse(string):
    string = string[::-1]
    return string


# and the cancer begins
def first_last(i):
    first = re.search(r'\d|one|two|three|four|five|six|seven|eight|nine', i)[0]
    if first.isalpha():
        for word in first:
            # should be able to file in the first and second paramaters
            # from a list in a for loop instead of manually doing this but it
            # works I guess
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
    # holy shit wtf am I doing????
    last = re.search(r'\d|eno|owt|eerht|ruof|evif|xis|neves|thgie|enin', i)[0]
    if last.isalpha():
        for word in last:
            # comment above would also work here, except use the reverse
            # function for each word in the list
            last = last.replace("eno", "1")
            last = last.replace("owt", "2")
            last = last.replace("eerht", "3")
            last = last.replace("ruof", "4")
            last = last.replace("evif", "5")
            last = last.replace("xis", "6")
            last = last.replace("neves", "7")
            last = last.replace("thgie", "8")
            last = last.replace("enin", "9")
    # append numbers together as string
    string = str(first + last)
    # convert to integer
    return int(string)


# set num to 0
num = 0

# add all the numbers up
for line in file:
    num = first_last(line) + int(num)

# return solution to part 2
print('part two asnwer:', num)
