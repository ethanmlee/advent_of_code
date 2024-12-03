#!/bin/sh

loop () {
  out=0
  mul=$(cat $1 | grep -oP 'mul\([0-9]{1,3},[0-9]{1,3}\)')

  for each in $mul; do
    x=$(echo ${each%,*} | cut -c 5-)
    y=$(echo ${each#*,} | rev | cut -c 2- | rev)

    out=$(( $x * $y + $out ))
  done

  echo $out
}

for file in "$@"; do
  silver=$(loop $file)
done

echo
echo $silver
