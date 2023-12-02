#!/bin/python

file = open('input.txt', 'r')

max_red = 12
max_green = 13
max_blue = 14

red = 0
green = 0
blue = 0


# parsing this file sucks
for line in file:

    # game number equals
    game = line.split(":")[0].split(" ")[-1]
    print("game:" + game)

    cubelist = line.split(":")[1:]
    for each in cubelist:

        # whats in the bag
        bag = each.split(";")
        print(bag)
        for each in bag:

            baglist = each.split(",")

            for numcolors in baglist:

                numcolors = numcolors.strip().split(" ")
                # how do add this up into the color name values defined at the
                # top?
                numcolors[1] = int(numcolors[0]) + int(numcolors[1])
