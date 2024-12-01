#!/bin/sh
c1=$(awk '{print $1}' input.txt | sort -n)
c2=$(awk '{print $2}' input.txt | sort -n)

o=0
for i in $(seq 1 $(wc -l < input.txt)); do
  mc1=$(echo $c1 | awk -v n=$i '{print $n}')
  mc2=$(echo $c2 | awk -v n=$i '{print $n}')

  d=$(expr $mc1 - $mc2)
  
  # if negative then make positive
  if [ $d -lt 0 ]; then
    d=$(expr $d \* -1)
  fi

  o=$(expr $o + $d)

done

echo $o
