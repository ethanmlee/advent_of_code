#!/bin/sh

if [ ! -f session.txt ]; then
    echo "Error: session.txt not found."
    exit 1
fi

session=$(cat session.txt)

year=$(date +"%Y")
day=$(date +"%-d")
if [ "$#" -ge 1 ]; then
    year=$1
fi
if [ "$#" -ge 2 ]; then
    day=$2
fi

url="https://adventofcode.com/$year/day/$day"
input_url="$url/input"
bigboy_url="https://github.com/Error916/Aoc$year/raw/refs/heads/main/bigboys/day$day.7z"
bigboy_solutions_url="https://raw.githubusercontent.com/Error916/Aoc$year/refs/heads/main/bigboys/day${day}_solutions.txt"

pull=$(curl -s --header "Cookie: session=$session;" "$url")
name=$(echo "$pull" | sed -n 's/.*<h2>--- Day [0-9]\+: \(.*\) ---<\/h2>.*/\1/p' | tr -d ' ')
dir="$year/$(printf "%02d" $day)_$name"

mkdir -p "$dir"

curl -s --header "Cookie: session=$session;" "$input_url" -o "$dir/input.txt"

# Download bigboy files
wget -q "$bigboy_solutions_url" -O "$dir/bigboy_solutions.txt"
wget -q "$bigboy_url" -O "$dir/day$day.7z"

# Extract bigboy archive if downloaded
if [ -f "$dir/day$day.7z" ]; then
    7z x -y "$dir/day$day.7z" -o"$dir/"
    rm "$dir/day$day.7z"
fi

echo "Setup complete for Day $day of $year."
