#!/bin/sh


# -1 to ignore \n
x_bounds=$(( $(head -n1 $@ | wc -c) -1 ))
y_bounds=$(cat $@ | wc -l )
file="$@"

char_at () {
    line=$(sed -n "${2}p" "$file")
    char=$(echo "$line" | cut -c "$1")
    echo $char
}

for y in $( seq 1 $y_bounds ); do

  for x in $( seq 1 $x_bounds ); do
    char_at $x $y
  done
done
