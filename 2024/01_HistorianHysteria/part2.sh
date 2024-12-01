#!/bin/sh
c1=$(awk '{print $1}' input.txt | sort -n)
c2=$(awk '{print $2}' input.txt | sort -n)

o=0
for i in $(seq 1 $(wc -l < input.txt)); do
  mc1=$(echo $c1 | awk -v n=$i '{print $n}')
  ss=$(echo "$c2" | grep -wc "^$mc1$" )

  o=$(expr $ss \* $mc1 + $o)


done

echo $o
