#!/bin/python
import sys

input_file = sys.argv[1]

file = open(input_file, 'r')

colors_max = {'red': 0, 'green': 0, 'blue': 0}
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
        number = int(color_count[0])
        if colors_max[color] < number:
            colors_max[color] = number
    print(colors_max)

    # get power of game
    power = 1
    for each in colors_max:
        power = power*colors_max[each]
    final = power + final

    # reset colors_max
    for key in colors_max.keys():
        colors_max[key] = 0

print(final)
