#!/bin/python

file = open('input.txt', 'r')

colors = ['red', 'green', 'blue']
colors_max = {'red': 12, 'green': 13, 'blue': 14}
final = 0

for line in file:
    # game number
    gamenum = line.split(":")[0].split(" ")[-1]
    isPossible = True

    # create and clean cubelist
    cubelist = line.split(":")[1:]
    for each in cubelist:
        each = each.replace(";",  ",")
        cubelist = each.split(",")
        cubelist = [x.lstrip().strip() for x in cubelist]

    for each in cubelist:
        color_count = each.split(" ")
        color = color_count[1]
        number = color_count[0]
        max = colors_max[color]

        if int(number) > max:
            isPossible = False
    if isPossible is True:
        print(gamenum)
        final = final + int(gamenum)

print(final)
