#!/bin/sh

silver=0

while read line; do
  fnum=1
  safe=1
  while [ "$fnum" -le "$(( $(echo $line | wc -w) - 1 ))" ]; do
    addnum=$(($fnum + 1))

    x=$(echo "$line" | awk -v i="$fnum" '{print $i}')
    y=$(echo "$line" | awk -v i="$addnum" '{print $i}')
    
    d=$(( $x - $y ))
    [ $d -lt 0 ] && d=$(( $d * -1 ))
    [ $d -ge 3 ] && safe=False && break || safe=True
    fnum=$addnum
  done

  [ $safe = True ] && silver=$(( $silver + 1 ))

done < $@

echo $silver
