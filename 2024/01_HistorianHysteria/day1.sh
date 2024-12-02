#!/bin/sh
c1=$(awk '{print $1}' $@ | sort -n)
c2=$(awk '{print $2}' $@ | sort -n)

silver=0
gold=0
for i in $(seq 1 $(wc -l < $@)); do
  mc1=$(echo $c1 | awk -v n=$i '{print $n}')
  ss=$(echo "$c2" | grep -wc "^$mc1$" )
  mc2=$(echo $c2 | awk -v n=$i '{print $n}')

  d=$(expr $mc1 - $mc2)

  # if negative then make positive
  [ $d -lt 0 ] && d=$(expr $d \* -1)


  echo $mc1 $mc2 $d

  silver=$(expr $silver + $d)
  gold=$(expr $ss \* $mc1 + $gold)

done

echo
echo $silver
echo $gold
