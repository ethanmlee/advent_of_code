#!/bin/sh

loop () {
  out=0
  mul=$($1 | grep -oP 'mul\([0-9]{1,3},[0-9]{1,3}\)')

  for each in $mul; do
    x=$(echo ${each%,*} | cut -c 5-)
    y=$(echo ${each#*,} | rev | cut -c 2- | rev)

    out=$(( $x * $y + $out ))
  done

  echo $out
}

for file in "$@"; do
  silver=$(loop "cat $file")

  gold_file=$(sed ':a;/don'\''t()[^d]*do()/{s/don'\''t()[^d]*do()//; ba}' "$file")

  gold=$(loop "echo $gold_file")

done

echo
echo $silver
echo $gold
