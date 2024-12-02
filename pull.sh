#!/bin/sh

session=$(cat session.txt)

url="https://adventofcode.com/$(date +"%Y")/day/$(date +"%-d")"

pull=$(curl -s --header "Cookie: session=$session;" "$url")

name=$(echo "$pull" \
| sed -n 's/.*<h2>--- Day [0-9]\+: \(.*\) ---<\/h2>.*/\1/p' \
| tr -d ' ')

dir=$(date +"%Y")/$(date +"%d")_$name
mkdir -p "$dir"

curl -s --header "Cookie: session=$session;" "${url}/input" -o "$dir/input.txt"

touch $dir/run.sh && chmod +x $dir/run.sh

day=$(date +"%-d")
bigboy="https://github.com/Error916/Aoc2024/raw/refs/heads/main/bigboys/day$day.7z"
bigboy_solutions="https://raw.githubusercontent.com/Error916/Aoc2024/refs/heads/main/bigboys/day$(day)_solutions.txt"

wget $bigboy_solutions && mv -o bigboy_solutions.txt $dir
wget $bigboy && mv day$day.7z $dir && [ ! -f $dir/bigboy.txt ] && 7z x $dir/
rm $dir/day$day.7z
